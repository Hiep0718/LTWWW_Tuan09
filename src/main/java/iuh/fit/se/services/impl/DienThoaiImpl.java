package iuh.fit.se.services.impl;

import iuh.fit.se.entities.DienThoai;
import iuh.fit.se.repositories.DienThoaiRepository;
import iuh.fit.se.services.DienThoaiService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DienThoaiImpl implements DienThoaiService {
    DienThoaiRepository dienThoaiRepository;
    ModelMapper modelMapper;

    @Autowired
    public DienThoaiImpl(DienThoaiRepository dienThoaiRepository, ModelMapper modelMapper) {
        this.dienThoaiRepository = dienThoaiRepository;
        this.modelMapper = modelMapper;
    }

    private DienThoai convertToEntity(DienThoai dienThoai) {
        DienThoai dt = modelMapper.map(dienThoai, DienThoai.class);
        return dt;
    }

}
