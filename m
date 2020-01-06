Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9CC0130AD3
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jan 2020 01:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgAFAMI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 5 Jan 2020 19:12:08 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:41673 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbgAFAMH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 5 Jan 2020 19:12:07 -0500
X-Originating-IP: 90.65.92.102
Received: from localhost (lfbn-lyo-1-1913-102.w90-65.abo.wanadoo.fr [90.65.92.102])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5890DFF803;
        Mon,  6 Jan 2020 00:12:04 +0000 (UTC)
Date:   Mon, 6 Jan 2020 01:12:04 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RTC fixes for 5.5
Message-ID: <20200106001204.GA776560@piout.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Linus,

A few fixes for this cycle. The CMOS AltCentury support broke a few
platforms with a recent BIOS so I reverted it. The mt6397 fix is not
that critical but good to have. And finally, the sun6i fix repairs WiFi
and BT on a few platforms.

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc=
-5.5-2

for you to fetch changes up to f01f4ffdfb703694035870f94b10f6ef2523f8de:

  rtc: cmos: Revert "rtc: Fix the AltCentury value on AMD/Hygon platform" (=
2020-01-04 05:31:50 +0100)

----------------------------------------------------------------
RTC fixes for 5.5

 - cmos: revert AltCentury support on AMD/Hygon
 - mt6397: fix alarm register overwrite
 - sun6i: ensure clock is working on R40

----------------------------------------------------------------
Alexandre Belloni (1):
      rtc: cmos: Revert "rtc: Fix the AltCentury value on AMD/Hygon platfor=
m"

Chen-Yu Tsai (1):
      rtc: sun6i: Add support for RTC clocks on R40

Ran Bi (1):
      rtc: mt6397: fix alarm register overwrite

 drivers/rtc/rtc-mc146818-lib.c | 15 +--------------
 drivers/rtc/rtc-mt6397.c       | 39 +++++++++++++++++++++++++--------------
 drivers/rtc/rtc-sun6i.c        | 16 ++++++++++++++++
 include/linux/mfd/mt6397/rtc.h |  8 ++++++++
 4 files changed, 50 insertions(+), 28 deletions(-)

--=20
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEycoQi/giopmpPgB12wIijOdRNOUFAl4Se0gACgkQ2wIijOdR
NOUgtA//dDD+MymlwZbpnKcKDIN0CLfd8/lIqlhI9Tn9D+LBdob6S6HpY6apR9UC
hjoh1jZORgtlvDaq8imw6z0pqI1E16l+JDjmIG/CxWDCQhYIJGSkUD2lvTHe5YZr
WayszcaLdJqU/HYfBb1vOFCgcuw7MIuZaBMDPeMQ0U6wWY0y6tTc+rx77FArbeue
rc7Rg+AZIuixxNjDce9a6NHFFpJzxBdy6jd7kws0jfhFIx7Ol/4BmPp4rKJgt7xb
iUf78gkSKGUHPlO08wsQO9KOYsS6Km/EOu2pgoeJYK9ZYVi5H7ee84zdH/GSAk/8
5yDLC4AMlnAMza6KKtcJ2pC74M5sZHk1GH+Sr6LqH1JQ+4obyZ9gcduojR7sA5fi
GrVIIA2XQOeTtThXxdwpLQnqHZSbGF1w9fq46dP/sp/tS7i/B6cVx3ed6Cpso+Zi
t7XrY+IC6FhaUf3ZL2ldc2cHS6a2Fh6LHwyFUXivdorR1Msbu9A+3QsTnSyeLDKI
EKLGylK/vUCnX0RR5sCNLEACrXAZwjsoXlpu07gxDRks7rTL27xYYoUteGrHUQmH
M7P76Vh2Qt5oHgRzyCf0cs2yQrUNRCOuE9GxvK4edAgntbf7AC0EGS0MpGyQDBZ8
BtsF0O4RR/+fXqEq7H4SwtutecWMZ2zh6mQbZ0QcocpMO7fmADc=
=sWEr
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
