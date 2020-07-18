Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D420D2247CF
	for <lists+linux-rtc@lfdr.de>; Sat, 18 Jul 2020 03:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbgGRBi4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jul 2020 21:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgGRBi4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jul 2020 21:38:56 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE31C0619D2;
        Fri, 17 Jul 2020 18:38:56 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7rHf0sfDz9sSt;
        Sat, 18 Jul 2020 11:38:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595036334;
        bh=KwdV0zFfsed7iFUlolMU4dmFArtNxfTQjE+hDf9oNT0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Vo2plUFogRNZIrfmPHCaSGtuSvm5g+P2grDJmJCiEHtNaoMa5Zu+GaFdNw7WmE3Fd
         SGtqh6b/9lahSClv/zFNTBrLmMH8rO7Kwn19o9zUxD82NoHF9sIC0jMTtQJbNq8zjr
         bqNyse9mrq+UqwNkWsLTh2VPamKUjGO+8gxSKFFLK2NuyAzw9/d+MRDU+IHwLGr22f
         HhDeSXZ/8CWEq6n56vqgeVLqTtDPCxX1XG94yD/RPMQvliR4OmLsB2gslL4l0fcg4K
         CcdR2VMZBGq40DixURuGme6ZeiDJXIr8ATPOWV3twj7h3/N0+WMesDnqOzVCdMmkqM
         WxA2nUa58Lq7Q==
Date:   Sat, 18 Jul 2020 11:38:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Scott Wood <scottwood@freescale.com>,
        "Johnson CH Chen (=?UTF-8?B?6Zmz5pit5Yuz?=)" 
        <JohnsonCH.Chen@moxa.com>
Subject: Re: linux-next: Tree for Jul 17 (drivers/rtc/rtc-ds1374.o)
Message-ID: <20200718113853.6bd63897@canb.auug.org.au>
In-Reply-To: <d36fac01-2a7b-c3f1-84ef-3a1560d18790@infradead.org>
References: <20200717214036.67fa5379@canb.auug.org.au>
        <d36fac01-2a7b-c3f1-84ef-3a1560d18790@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k2IUwGeBI7c=_Pi1cUnbtWZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/k2IUwGeBI7c=_Pi1cUnbtWZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

[Please trim your emails a bit more, thanks]

On Fri, 17 Jul 2020 09:49:05 -0700 Randy Dunlap <rdunlap@infradead.org> wro=
te:
> on x86_64:
> # CONFIG_WATCHDOG is not set
>=20
> ld: drivers/rtc/rtc-ds1374.o: in function `ds1374_probe':
> rtc-ds1374.c:(.text+0x736): undefined reference to `watchdog_init_timeout'
> ld: rtc-ds1374.c:(.text+0x77e): undefined reference to `devm_watchdog_reg=
ister_device'

Caused by commit

  d3de4beb14a8 ("rtc: ds1374: wdt: Use watchdog core for watchdog part")

from the rtc tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/k2IUwGeBI7c=_Pi1cUnbtWZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8SUq0ACgkQAVBC80lX
0GwmYQf/b9MIx545+4QiU0BgJ3WpM57kY2Ui95nGJ56BI82/pKDGVZA1N4GX+Bze
TOR+tDoPr1HKOp5R+7dgkLbOMHGbFWpy5AEREjlEjauZHNH+TSvYcnb6F9evHSIX
8V1SvbtGv1vNwDXkWgvqjwf63fV4fY6e5cs6Ppe/30a/PhOFepdf/ou6vmp0eIDL
5wvFqhRDY7ovZCgSIRHJYiToCHd07K9CsvnsWQWITweReVC/Xs1Ri0cpTxbtXiQn
3oHJCUC3s7WbH71RZMWiP4IhXOQ8p9BGyOyEIsck0FD305FwRR4ZMnNEjdHan3qX
7Edp8erFhl/N7RpzXYj5l2BBDVP+dw==
=fykx
-----END PGP SIGNATURE-----

--Sig_/k2IUwGeBI7c=_Pi1cUnbtWZ--
