package dao;

import model.Reservation;
import model.User;
import model.Trajet;
import model.Promotion;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.Hibernate;
import org.hibernate.Transaction;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ReservationDAO {
    private final SessionFactory sessionFactory;

    public ReservationDAO(SessionFactory sessionFactory) {
        if (sessionFactory == null) {
            throw new IllegalArgumentException("SessionFactory cannot be null");
        }
        this.sessionFactory = sessionFactory;
    }

    public void save(Reservation reservation) {
        if (reservation == null) {
            throw new IllegalArgumentException("Reservation cannot be null");
        }
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.persist(reservation);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Failed to save reservation: " + e.getMessage(), e);
        }
    }

    public Reservation findById(Long id) {
        if (id == null || id <= 0) {
            throw new IllegalArgumentException("ID must be a positive non-null value");
        }
        try (Session session = sessionFactory.openSession()) {
            Reservation reservation = session.get(Reservation.class, id);
            if (reservation != null) {
                Hibernate.initialize(reservation.getUser());
                Hibernate.initialize(reservation.getVoyage());
                if (reservation.getVoyage() != null) {
                    Hibernate.initialize(reservation.getVoyage().getTrajet());
                    if (reservation.getVoyage().getTrajet() != null) {
                        Hibernate.initialize(reservation.getVoyage().getTrajet().getDepartStation());
                        Hibernate.initialize(reservation.getVoyage().getTrajet().getArrivalStation());
                    }
                }
            }
            return reservation;
        } catch (Exception e) {
            throw new RuntimeException("Failed to find reservation by ID " + id + ": " + e.getMessage(), e);
        }
    }

    public List<Reservation> findByUserAndEtat(User user, String etat) {
        if (user == null || etat == null || etat.trim().isEmpty()) {
            throw new IllegalArgumentException("User and etat cannot be null or empty");
        }
        try (Session session = sessionFactory.openSession()) {
            Query<Reservation> query = session.createQuery(
                "FROM Reservation WHERE user = :user AND etat = :etat", Reservation.class);
            query.setParameter("user", user);
            query.setParameter("etat", etat);
            return query.list();
        } catch (Exception e) {
            throw new RuntimeException("Failed to find reservations by user and etat: " + e.getMessage(), e);
        }
    }
    public List<Reservation> findByUserr(User user) {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        try (Session session = sessionFactory.openSession()) {
            Query<Reservation> query = session.createQuery(
                "SELECT r FROM Reservation r " +
                "JOIN FETCH r.user u " +
                "JOIN FETCH r.voyage v " +
                "JOIN FETCH v.trajet t " +
                "JOIN FETCH t.departStation ds " +
                "JOIN FETCH t.arrivalStation as " +
                "WHERE r.user = :user", Reservation.class);
            query.setParameter("user", user);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Failed to find reservations by user: " + e.getMessage(), e);
        }
    }

    public List<Reservation> findByUserAndVoyageId(User user, Long voyageId) {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        if (voyageId == null || voyageId <= 0) {
            throw new IllegalArgumentException("Voyage ID must be a positive non-null value");
        }
        try (Session session = sessionFactory.openSession()) {
            Query<Reservation> query = session.createQuery(
                "SELECT r FROM Reservation r " +
                "JOIN FETCH r.user u " +
                "JOIN FETCH r.voyage v " +
                "JOIN FETCH v.trajet t " +
                "JOIN FETCH t.departStation ds " +
                "JOIN FETCH t.arrivalStation as " +
                "WHERE r.user = :user AND r.voyage.id = :voyageId", Reservation.class);
            query.setParameter("user", user);
            query.setParameter("voyageId", voyageId);
            return query.getResultList();
        } catch (Exception e) {
            throw new RuntimeException("Failed to find reservations by user and voyage ID " + voyageId + ": " + e.getMessage(), e);
        }
    }

    public List<Reservation> findByUser(User user) {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be null");
        }
        try (Session session = sessionFactory.openSession()) {
            Query<Reservation> query = session.createQuery(
                "FROM Reservation WHERE user = :user", Reservation.class);
            query.setParameter("user", user);
            List<Reservation> reservations = query.list();
            for (Reservation reservation : reservations) {
                Hibernate.initialize(reservation.getUser());
                Hibernate.initialize(reservation.getVoyage());
                if (reservation.getVoyage() != null) {
                    Hibernate.initialize(reservation.getVoyage().getTrajet());
                    if (reservation.getVoyage().getTrajet() != null) {
                        Hibernate.initialize(reservation.getVoyage().getTrajet().getDepartStation());
                        Hibernate.initialize(reservation.getVoyage().getTrajet().getArrivalStation());
                    }
                }
            }
            return reservations;
        } catch (Exception e) {
            throw new RuntimeException("Failed to find reservations by user: " + e.getMessage(), e);
        }
    }

    public List<Reservation> findByEtat(String etat) {
        if (etat == null || etat.trim().isEmpty()) {
            throw new IllegalArgumentException("Etat cannot be null or empty");
        }
        try (Session session = sessionFactory.openSession()) {
            Query<Reservation> query = session.createQuery(
                "FROM Reservation WHERE etat = :etat", Reservation.class);
            query.setParameter("etat", etat);
            List<Reservation> reservations = query.list();
            for (Reservation reservation : reservations) {
                Hibernate.initialize(reservation.getUser());
                Hibernate.initialize(reservation.getVoyage());
                if (reservation.getVoyage() != null) {
                    Hibernate.initialize(reservation.getVoyage().getTrajet());
                    if (reservation.getVoyage().getTrajet() != null) {
                        Hibernate.initialize(reservation.getVoyage().getTrajet().getDepartStation());
                        Hibernate.initialize(reservation.getVoyage().getTrajet().getArrivalStation());
                    }
                }
            }
            return reservations;
        } catch (Exception e) {
            throw new RuntimeException("Failed to find reservations by etat: " + e.getMessage(), e);
        }
    }

    public List<Reservation> findAllByEtat(String etat) {
        if (etat == null || etat.trim().isEmpty()) {
            throw new IllegalArgumentException("Etat cannot be null or empty");
        }
        try (Session session = sessionFactory.openSession()) {
            Query<Reservation> query = session.createQuery(
                "FROM Reservation WHERE etat = :etat", Reservation.class);
            query.setParameter("etat", etat);
            List<Reservation> reservations = query.list();
            for (Reservation reservation : reservations) {
                Hibernate.initialize(reservation.getUser());
                Hibernate.initialize(reservation.getVoyage());
                if (reservation.getVoyage() != null) {
                    Hibernate.initialize(reservation.getVoyage().getTrajet());
                    if (reservation.getVoyage().getTrajet() != null) {
                        Hibernate.initialize(reservation.getVoyage().getTrajet().getDepartStation());
                        Hibernate.initialize(reservation.getVoyage().getTrajet().getArrivalStation());
                    }
                }
            }
            return reservations;
        } catch (Exception e) {
            throw new RuntimeException("Failed to find reservations by etat: " + e.getMessage(), e);
        }
    }

    public List<Reservation> findAllUsedReservations() {
        try (Session session = sessionFactory.openSession()) {
            Query<Reservation> query = session.createQuery(
                "FROM Reservation WHERE etat = 'utilis�'", Reservation.class);
            List<Reservation> reservations = query.list();
            for (Reservation reservation : reservations) {
                Hibernate.initialize(reservation.getUser());
                Hibernate.initialize(reservation.getVoyage());
                if (reservation.getVoyage() != null) {
                    Hibernate.initialize(reservation.getVoyage().getTrajet());
                    if (reservation.getVoyage().getTrajet() != null) {
                        Hibernate.initialize(reservation.getVoyage().getTrajet().getDepartStation());
                        Hibernate.initialize(reservation.getVoyage().getTrajet().getArrivalStation());
                    }
                }
            }
            return reservations;
        } catch (Exception e) {
            throw new RuntimeException("Failed to find used reservations: " + e.getMessage(), e);
        }
    }

    public List<Reservation> findPurchasedReservationsBeforeDate(LocalDateTime dateTime) {
        if (dateTime == null) {
            throw new IllegalArgumentException("DateTime cannot be null");
        }
        try (Session session = sessionFactory.openSession()) {
            Query<Reservation> query = session.createQuery(
                "FROM Reservation r WHERE r.etat = :etat AND r.voyage.heureDepart <= :dateTime",
                Reservation.class
            );
            query.setParameter("etat", "achet�");
            query.setParameter("dateTime", dateTime);
            List<Reservation> reservations = query.list();
            for (Reservation reservation : reservations) {
                Hibernate.initialize(reservation.getUser());
                Hibernate.initialize(reservation.getVoyage());
                if (reservation.getVoyage() != null) {
                    Hibernate.initialize(reservation.getVoyage().getTrajet());
                    if (reservation.getVoyage().getTrajet() != null) {
                        Hibernate.initialize(reservation.getVoyage().getTrajet().getDepartStation());
                        Hibernate.initialize(reservation.getVoyage().getTrajet().getArrivalStation());
                    }
                }
            }
            return reservations;
        } catch (Exception e) {
            throw new RuntimeException("Failed to find purchased reservations before date: " + e.getMessage(), e);
        }
    }

    public void update(Reservation reservation) {
        if (reservation == null || reservation.getId() == null) {
            throw new IllegalArgumentException("Reservation or ID cannot be null");
        }
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.merge(reservation);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Failed to update reservation with ID " + reservation.getId() + ": " + e.getMessage(), e);
        }
    }

    public void delete(Reservation reservation) {
        if (reservation == null || reservation.getId() == null) {
            throw new IllegalArgumentException("Reservation or ID cannot be null");
        }
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.remove(session.contains(reservation) ? reservation : session.merge(reservation));
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Failed to delete reservation with ID " + reservation.getId() + ": " + e.getMessage(), e);
        }
    }

    public List<Object[]> findMostPopularTrajets() {
        try (Session session = sessionFactory.openSession()) {
            Query<Object[]> query = session.createQuery(
                "SELECT r.voyage.trajet, COUNT(r) as reservationCount " +
                "FROM Reservation r " +
                "GROUP BY r.voyage.trajet " +
                "ORDER BY reservationCount DESC", Object[].class);
            query.setMaxResults(10);
            List<Object[]> results = query.list();
            for (Object[] result : results) {
                Trajet trajet = (Trajet) result[0];
                Hibernate.initialize(trajet.getDepartStation());
                Hibernate.initialize(trajet.getArrivalStation());
            }
            return results;
        } catch (Exception e) {
            throw new RuntimeException("Failed to find most popular trajets: " + e.getMessage(), e);
        }
    }

    public Double calculateTotalRevenue(LocalDateTime startDate, LocalDateTime endDate) {
        if (startDate == null || endDate == null) {
            throw new IllegalArgumentException("Start date and end date cannot be null");
        }
        try (Session session = sessionFactory.openSession()) {
            Query<Double> query = session.createQuery(
                "SELECT SUM(v.prix) " +
                "FROM Reservation r JOIN r.voyage v " +
                "WHERE r.dateReservation BETWEEN :startDate AND :endDate " +
                "AND r.etat = 'achet�'", Double.class);
            query.setParameter("startDate", startDate);
            query.setParameter("endDate", endDate);
            Double result = query.uniqueResult();
            return result != null ? result : 0.0;
        } catch (Exception e) {
            throw new RuntimeException("Failed to calculate total revenue: " + e.getMessage(), e);
        }
    }

}