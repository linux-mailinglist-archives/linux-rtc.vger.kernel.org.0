Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A57225680
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Jul 2020 06:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725287AbgGTEVM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Jul 2020 00:21:12 -0400
Received: from ozlabs.org ([203.11.71.1]:46901 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbgGTEVL (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 20 Jul 2020 00:21:11 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B97nv0n89z9sRN;
        Mon, 20 Jul 2020 14:21:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595218869;
        bh=BmUytb5hrWXf0QaZ6oP8WcobROwkL4zX4ig1IdgR4IU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hyhbuh3kwM6l2xXy8OOVC3s9NafDGl3UG3gAUrLsoLCksVZNm2tW9IPwcQZinM30f
         WV4NuIRtlVVjSgE1v0Srv8VkfmQjXNL6I0XyccYllFFJ9lJu3TimY7xDiJ2wup3Lwj
         4kXLYH0RCxoNAzYWKWZWAC1MF2SxGa8x7c2P5L7YgOwvaXjcKwKal+8YlWVNbRp74b
         54cBLJ6/VUO7Fbnjxzwfohcd0CZWM6CWT9OefmGz3Y69hr83XUCyIdRSdh7H0+IXud
         FO0FS/v1jIhTm382I3mhEXjthNSOaxAGgVA9tcn6Habi/oFsyKEQvhZy2fbTNgm+zw
         U9I3zm5E/Uw+Q==
Date:   Mon, 20 Jul 2020 14:21:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Johnson CH Chen (=?UTF-8?B?6Zmz5pit5Yuz?=)" 
        <JohnsonCH.Chen@moxa.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Scott Wood <scottwood@freescale.com>
Subject: Re: linux-next: Tree for Jul 17 (drivers/rtc/rtc-ds1374.o)
Message-ID: <20200720142106.77467bc6@canb.auug.org.au>
In-Reply-To: <HK2PR01MB32812019FB4521DC22313B10FA7B0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
References: <20200717214036.67fa5379@canb.auug.org.au>
        <d36fac01-2a7b-c3f1-84ef-3a1560d18790@infradead.org>
        <20200718113853.6bd63897@canb.auug.org.au>
        <HK2PR01MB32812019FB4521DC22313B10FA7B0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+I7b2vLsrvd0Sn8b=GcKGyM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/+I7b2vLsrvd0Sn8b=GcKGyM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Johnson,

On Mon, 20 Jul 2020 03:46:15 +0000 Johnson CH Chen (=E9=99=B3=E6=98=AD=E5=
=8B=B3) <JohnsonCH.Chen@moxa.com> wrote:
>
> > On Fri, 17 Jul 2020 09:49:05 -0700 Randy Dunlap <rdunlap@infradead.org>
> > wrote: =20
> > > on x86_64:
> > > # CONFIG_WATCHDOG is not set
> > > =20
>=20
> Thanks for your information.
>=20
> It seems RTC_DRV_DS1374_WDT should be depended on RTC_DRV_DS1374 && WATCH=
DOG_CORE. Otherwise error will happen if RTC_DRV_DS1374_WDT is enabled but =
WATCHDOG_CORE not. I'll put this into v5 if there are no other suggestions.
>=20
> Should I add " Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>" into=
 v5? So many thanks!

Probably "Reported-by: Randy Dunlap <rdunlap@infradead.org>" is more approp=
riate.

--=20
Cheers,
Stephen Rothwell

--Sig_/+I7b2vLsrvd0Sn8b=GcKGyM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8VG7IACgkQAVBC80lX
0Gwlowf8D7f0UTM40chSal9cLaKa5otE1B22GRMDOpr5NFpcEeWN1rIg/54z6ioT
tOv9YOjdiysh3S2qJFQAhj+lQ425JKlRWoJD5u4fRrqMCS6C+LTQlia278qF9YuL
SHzfJAGYoYl+DKNvcPQ3wxTb0OqyN7bxkW8hSpg9Dy1jzJixx5c4ndk+B2mbuO9e
ZHEgvFdSLQlhEGh20svZSIZFnXOCUD2rKmnSsByfsQ8NBiUQltCr/fkDTYovo37l
7URmhjqb2v5r/ROkTiK/2VUJL/14VM8bvpw+oivpGn8vntbdsLoLUNVXlekF+A7z
QiNJQ5zDKQY2W43cnXRMhVn4vp8Row==
=z1xY
-----END PGP SIGNATURE-----

--Sig_/+I7b2vLsrvd0Sn8b=GcKGyM--
