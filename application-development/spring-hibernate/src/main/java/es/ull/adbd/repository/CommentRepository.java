package es.ull.adbd.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import es.ull.adbd.model.Comment;
import jakarta.transaction.Transactional;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    List<Comment> findByTutorialId(Long postId);

    @Transactional
    void deleteByTutorialId(long tutorialId);
}
