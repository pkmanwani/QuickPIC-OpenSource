! part3d_lib module for QuickPIC Open Source 1.0
! update: 04/18/2016

      module part3d_lib
         
      implicit none

!
      interface
         subroutine PRVDIST32_RANDOM(part,edges,npp,nps,vtx,vty,vtz,vdx,&
         &vdy,vdz,npx,npy,npz,nx,ny,nz,ipbc,idimp,npmax,mblok,nblok,idps&
         &,sigx,sigy,sigz,x0,y0,z0,cx,cy,lquiet,ierr)
         implicit none
         integer, intent(in) :: npmax,nblok,npx,npy,npz,idimp,nx,ny,nz,i&
         &dps,mblok,ipbc
         integer, intent(inout) :: nps,npp,ierr
         real, intent(in) :: sigx,sigy,sigz,x0,y0,z0,cx,cy,edges,vtx,vty&
         &,vtz,vdx,vdy,vdz
         real, intent(inout) :: part
         logical, intent(in) :: lquiet
         dimension part(idimp,npmax,nblok)
         dimension edges(idps,nblok)
         dimension cx(0:2),cy(0:2)
         end subroutine
      end interface
!
      interface
         subroutine PGPOST32L(part,q,npp,noff,qm,idimp,npmax,mnblok,nxv,&
         &nypmx,nzpmx,idds)
         implicit none
         integer, intent(in) :: npp,noff,idimp,npmax,mnblok,nxv,nypmx,nz&
         &pmx,idds
         real, intent(inout) :: part
         real, intent(in) :: qm
         real, intent(inout) :: q
         dimension part(idimp,npmax,mnblok), q(nxv,nypmx,nzpmx,mnblok)
         dimension noff(idds,mnblok)
         end subroutine
      end interface
!
      interface
         subroutine PGBPUSH32L_QP(part,fxyz,bxyz,npp,noff,qbm,dt,dtc,ek,&
         &nx,ny,nz,idimp,npmax,mnblok,nxv,nypmx,nzpmx,idds,ipbc,deltax,d&
         &eltaz,cofd)
         implicit none
         real, dimension(idimp,npmax,mnblok), intent(inout) :: part
         integer, intent(inout) :: npp
         real, intent(inout) :: fxyz,bxyz
         real, intent(in) :: qbm,dt,dtc,ek,deltax,deltaz,cofd
         integer, intent(in) :: noff,nx,ny,nz,idimp,npmax,mnblok,nxv,nyp&
         &mx,nzpmx,idds,ipbc
         dimension fxyz(3,nxv,nypmx,nzpmx,mnblok)
         dimension bxyz(3,nxv,nypmx,nzpmx,mnblok)
         dimension noff(idds,mnblok)
         end subroutine
      end interface
!      
      interface
         subroutine PMOVE32(part,edges,npp,sbufr,sbufl,rbufr,rbufl,ihole&
         &,pbuff,jsr,jsl,jss,ny,nz,kstrt,nvpy,nvpz,idimp,npmax,mblok,nbl&
         &ok,idps,nbmax,idds,ntmax,tag1,tag2,id,info)
         implicit none
         real, intent(inout) :: part, pbuff
         real, intent(in) :: edges, sbufr, sbufl, rbufr, rbufl
         integer, intent(inout) :: npp, id, info
         integer, intent(in) :: ihole, jsr, jsl, jss
         integer, intent(in) :: ny, nz, kstrt, nvpy, nvpz, idimp, npmax
         integer, intent(in) :: idps, nbmax, idds, ntmax, mblok, nblok
         integer, intent(in) :: tag1, tag2
         dimension part(idimp,npmax,mblok*nblok)
         dimension pbuff(idimp,nbmax)
         dimension edges(idps,mblok*nblok)
         dimension sbufl(idimp,nbmax,mblok*nblok)
         dimension sbufr(idimp,nbmax,mblok*nblok)
         dimension rbufl(idimp,nbmax,mblok*nblok)
         dimension rbufr(idimp,nbmax,mblok*nblok)
         dimension jsl(idds,mblok*nblok), jsr(idds,mblok*nblok)
         dimension jss(idds,mblok*nblok)
         dimension ihole(ntmax,mblok*nblok)
         dimension info(9)      
         end subroutine
      end interface
!      
      end module part3d_lib