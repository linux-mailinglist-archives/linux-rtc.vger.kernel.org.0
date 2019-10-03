Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD9BC9F26
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 15:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728786AbfJCNO6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 09:14:58 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:40089 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfJCNO6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 09:14:58 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46kYQ73LN2z1rpSZ;
        Thu,  3 Oct 2019 15:14:55 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46kYQ72G6Nz1qqkM;
        Thu,  3 Oct 2019 15:14:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id qyrIp-v7WbMQ; Thu,  3 Oct 2019 15:14:54 +0200 (CEST)
X-Auth-Info: xiZETJUVqfKpf2L5V7ri6d768Sag1oWyEMv8K/uuf50=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  3 Oct 2019 15:14:54 +0200 (CEST)
Date:   Thu, 3 Oct 2019 15:14:34 +0200
From:   Lukasz Majewski <lukma@denx.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Add support for century bits to m41t62 (rv4162)
 RTC devices
Message-ID: <20191003151434.49762715@jawa>
In-Reply-To: <20191003123538.GS4106@piout.net>
References: <20190911154803.15969-1-lukma@denx.de>
        <20191003114831.GR4106@piout.net>
        <20191003142150.3d73a9d7@jawa>
        <20191003123538.GS4106@piout.net>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/j/.C7KS_WRAAcH/i3tvI2vT"; protocol="application/pgp-signature"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/j/.C7KS_WRAAcH/i3tvI2vT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

> On 03/10/2019 14:21:50+0200, Lukasz Majewski wrote:
> > >=20
> > > See the datasheet:
> > >=20
> > > "During any year which is a multiple of 4, the RV-4162 RTC will
> > > automatically insert leap day, February 29.  Therefore, the
> > > application software must correct for this during the exception
> > > years (2100, 2200, etc.) as noted above." =20
> >=20
> > I'm wondering what the phrase "application software" means here?
> >=20
> > If it is the userland SW, then we shall at least be able to set
> > 2099 in this device and then count on software correction.
> >=20
> > If the "application software" is the kernel driver - the date
> > correction shall be done there (maybe some lookup table?).
> >=20
> > Personally, I do prefer the first option - this means that with this
> > patch we can set the time to e.g. 2234 year and then rely on
> > userland software (or libc) to do the correction.
> >  =20
>=20
> It is not possible to ensure this correction is properly done in
> software, there is no point in letting the user set those bits.
>=20
>=20

I see your point.

However, could you share your idea on testing setting RTC time to year
2100 on this particular IC (by using hctosys and friends)?


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/j/.C7KS_WRAAcH/i3tvI2vT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2V9DoACgkQAR8vZIA0
zr3BIQgAlkA+YDvGJVBeIvlyQeEpjCBRSOKg1njJc/zbo+dyLX04exb85bLdZaZa
/qdn/Haxk7CAh6I+vL8X57hcmdJSLBtev42HWSnIYlL8jabaU0SMm0s8kPFln3Bw
LpDaAaS8q5VM7dCmhtu8jzYOFyDvAZrmT5s1fLHu/FegEgMQAvHVR+ePLhebGRwl
IqAdmnmTV8kwVXz7RdhrxF61/0SgVqNqf4+IUszFInpHErdCIZZYRc7kw9GNtdYK
AQKB8Qw3/9gWIc9vsd1ZxLjQ1RJxDEMBvAVUM9Jc40m6ML4lRpmDGRDnIAlha2Uc
FkEVn2RQ6l+w58s4bhb6h8NBXVkLTg==
=9hH2
-----END PGP SIGNATURE-----

--Sig_/j/.C7KS_WRAAcH/i3tvI2vT--
