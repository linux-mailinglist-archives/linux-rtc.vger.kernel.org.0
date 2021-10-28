Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BF143E98D
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Oct 2021 22:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhJ1Uec (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 28 Oct 2021 16:34:32 -0400
Received: from mout02.posteo.de ([185.67.36.66]:44647 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230421AbhJ1Uec (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 28 Oct 2021 16:34:32 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 75D09240104
        for <linux-rtc@vger.kernel.org>; Thu, 28 Oct 2021 22:32:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1635453123; bh=EC+vaBb6SpWnM61YiWVHLh+L/Kcy2N+hRWQgXOQ7zJo=;
        h=Date:From:To:Cc:Subject:From;
        b=X2cMRUO+PYc9jYK8bdJV0DKVanlbj9QUuQGvo/AovPt0IrZQi/FEPjlbXBm0OG8wu
         pHY/fUQyE/8KmE4Voi1wMd8WB3drUQQaRfG3tRyd9LBg+0vHvqa1CxvsaYRdHboLhN
         jmGZh/Bql2tPB3uY+4sco0HZw4TMZuUOOqGgPxu+vbfwYSduSFVL0mEk1NDfAFPIKw
         AbRGKlpNh54nc/5eO2ugCjo3wfzgg9vjpgS32dS7gBi7SRF6SjXFpS5yvAwMfaqlzW
         iTwgdvKP2AxTLWTSi46FcmyNAAILJdryxdnm8RADhOlyIyJI4irc9PHL/0nhie8rlZ
         RILIINxtdhSSQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4HgHKX3TXQz6tmG;
        Thu, 28 Oct 2021 22:32:00 +0200 (CEST)
Date:   Thu, 28 Oct 2021 20:32:00 +0000
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        Alessandro Zummo <a.zummo@towertech.it>,
        rw-r-r-0644 <r.r.qwertyuiop.r.r@gmail.com>,
        Ash Logan <ash@heyquark.com>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: nintendo: Add a RTC driver for the GameCube, Wii
 and Wii U
Message-ID: <YXsIwGmgy+ZIyvWI@latitude>
References: <20211014220524.9988-1-linkmauve@linkmauve.fr>
 <YXmCQnJTujtak+Qy@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eh3yQKvrqMWVIUoi"
Content-Disposition: inline
In-Reply-To: <YXmCQnJTujtak+Qy@piout.net>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--eh3yQKvrqMWVIUoi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 27, 2021 at 06:45:54PM +0200, Alexandre Belloni wrote:
> Hello Emmanuel,
>=20
> Thanks for the patch!
>=20
> On 15/10/2021 00:05:24+0200, Emmanuel Gil Peyrot wrote:
[...]
> Something great to do would be to convert the driver to regmap, provding
> custom regmap_read and regmap_write functions to access the EXI bus.
> Then you'd get this directly in debugfs. And this could be split ou once
> other drivers need access to the bus (I guess power/reset at some
> point).

Ultimately, a proper bus driver might be even better. Another popular
(but 3rd-party) device on the EXI bus is the "USB Gecko", a serial port
adapter.

(But I realize it might be significantly more work. Not sure.)



Best regards, and in any case still thanks for working on the GC/Wii/U
platforms,
Jonathan

--eh3yQKvrqMWVIUoi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmF7CJwACgkQCDBEmo7z
X9sz0BAArAbsjQO4KkDYsiNIDR/nKc7wEEOGGrQLwmLQ7iGLTOnOntR8HC8ZvqXx
qgM7uFVrfK/psvvJQ19B3XDU+dHCrWc7PXjapmVjPVUdR/Fpta2+QU6agcrRuvyM
VDO0pP5FfpPwj5l1uF+FaJ65RCLt57ecK8Lvy+MZkMuAjhhAk6AB8CUA2SKLxOH4
uvag1b+tFBTT/yvYUJfFglfwkD2AHLjbwvegjCCi/9dKoMgSI/pNhjVTYzKVZKYu
eina+TVjUDm36itGQBUMINHcZI/uKEIZpLAHNhyyjmIyJWzcgHlPZp3V+aRC15W2
OIs+yTQflYvlEGBYmS3L8LO7dB4GmmK5SNncJmndAzgkL9Ot1iLFv58hoy1zqBqG
3uMVrfXyfGCNtmKTfw+p4OMHxh3qsXSh2aC1CZVfrjGb2HHlF/RiZyeb7t1aR9Ra
u96uUkAtxsNiJEOUv+HHN2pecNAzDtx+KUKrEA0P/zNtVKd1ncN3tirrBOla7fEp
+3GmmPZ3UrTMHbAL0KQrSDWOBdUYAjOCQZvF8o2UZrutyvS3yqAerN624hshxV28
4hF0cbQOaAh+5Zwym9JAZjIhqpLtXJoV/Enu5csAXOtDw4GyF0DLHgjLnvXZ+dy6
d5W1810VTaDVbQAjG7BjT7UE7AftXgPfZ5iFL75/ooBDtDc9QFs=
=cSf/
-----END PGP SIGNATURE-----

--eh3yQKvrqMWVIUoi--
