Return-Path: <linux-rtc+bounces-2311-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AD39AF98E
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Oct 2024 08:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0348282A94
	for <lists+linux-rtc@lfdr.de>; Fri, 25 Oct 2024 06:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4D218DF97;
	Fri, 25 Oct 2024 06:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=o2.pl header.i=@o2.pl header.b="ADsETGi/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44F918A6DF
	for <linux-rtc@vger.kernel.org>; Fri, 25 Oct 2024 06:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729836503; cv=none; b=cehzPt3VHuwaDW/TcI0hULI8IvLTGZtxgJA/Kk6p9jBxEbUNKRjegS0CIix+1jo2ie0H2PcNIuuHFOUqF6YGVaVyrUKT7GWWRlRgVsoVorS+pE+vaFK9b8SBi+eIwR6iS+LvYAhodOExsML+mxfMc+fDO36U28fXW++bmfwXyi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729836503; c=relaxed/simple;
	bh=lWY1cYjWDT0FuJ3rKkJUgyvPJglMPy9xp12xFCSV+dc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=VKXex7AgmKTitxSchNEIEftLPLFDlZdoYCHHzgEm9YdxGnFkyLGJ1NlSE+whKFWLY7zJYNaN55s+JRoE0KSm/7vCWqSGU8AWDOQar8j62xnx83801s6dFvanJYmDBUdvQ7y9LJq4c1VVMI8lWTevdYi3EkoUcjyqpjtqL24+njo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (1024-bit key) header.d=o2.pl header.i=@o2.pl header.b=ADsETGi/; arc=none smtp.client-ip=193.222.135.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 15452 invoked from network); 25 Oct 2024 08:01:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=1024a;
          t=1729836098; bh=NS9u9n+cTzjLwF5ONAS/jRv5numrk4hGVCqnQ6MLXjY=;
          h=From:To:CC:Subject;
          b=ADsETGi/PVztE9UrbE2ZbQ7ZRQ4jPPVd6oP8tmcExwnw8FRviz+zaNIKKg/AfCPkn
           GEtV7De4iKF74ZJZOcP9HWoQf0NWNMH7cYFnrJ3drOFNCnr2/Sv7yK/+vMBrlvBVWE
           3r1sMwc6y/QKkZ165EGzbZtmlFmWGf8o70XIXlFw=
Received: from 188.146.252.129.mobile.internet.t-mobile.pl (HELO [127.0.0.1]) (mat.jonczyk@o2.pl@[188.146.252.129])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <dmitry.torokhov@gmail.com>; 25 Oct 2024 08:01:38 +0200
Date: Fri, 25 Oct 2024 08:01:37 +0200
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Mario Limonciello <mario.limonciello@amd.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Joy Chakraborty <joychakr@google.com>, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_rtc=3A_cmos=3A_avoid_taking_?=
 =?US-ASCII?Q?rtc=5Flock_for_extended_period_of_time?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Zxqv9KYnBdtnuqox@google.com>
References: <Zxqv9KYnBdtnuqox@google.com>
Message-ID: <B8A0CC86-7C24-4154-B8F3-69CD6B6C94BD@o2.pl>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-WP-MailID: ee1af7991353aaae12cf921c9846d82d
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [kQO0]                               

Dnia 24 pa=C5=BAdziernika 2024 22:37:08 CEST, Dmitry Torokhov <dmitry=2Etor=
okhov@gmail=2Ecom> napisa=C5=82/a:
>On my device reading entirety of /sys/devices/pnp0/00:03/cmos_nvram0/nvme=
m
>takes about 9 msec during which time interrupts are off on the CPU that
>does the read and the thread that performs the read can not be migrated
>or preempted by another higher priority thread (RT or not)=2E
>
>Allow readers and writers be preempted by taking and releasing rtc_lock
>spinlock for each individual byte read or written rather than once per
>read/write request=2E

Hello,=20
A nice idea!=20
(sorry for any formatting problems, I'm on a train right now)=20

>
>Signed-off-by: Dmitry Torokhov <dmitry=2Etorokhov@gmail=2Ecom>
>---
> drivers/rtc/rtc-cmos=2Ec | 31 +++++++++++++++----------------
> 1 file changed, 15 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/rtc/rtc-cmos=2Ec b/drivers/rtc/rtc-cmos=2Ec
>index 35dca2accbb8=2E=2Ee8f2fe0d8560 100644
>--- a/drivers/rtc/rtc-cmos=2Ec
>+++ b/drivers/rtc/rtc-cmos=2Ec
>@@ -645,18 +645,17 @@ static int cmos_nvram_read(void *priv, unsigned int=
 off, void *val,
> 	unsigned char *buf =3D val;
>=20
> 	off +=3D NVRAM_OFFSET;
>-	spin_lock_irq(&rtc_lock);
>-	for (; count; count--, off++) {
>+	for (; count; count--, off++, buf++) {
>+		guard(spinlock_irq)(&rtc_lock);
> 		if (off < 128)
>-			*buf++ =3D CMOS_READ(off);
>+			*buf =3D CMOS_READ(off);
> 		else if (can_bank2)
>-			*buf++ =3D cmos_read_bank2(off);
>+			*buf =3D cmos_read_bank2(off);
> 		else
>-			break;
>+			return -EIO;
> 	}
>-	spin_unlock_irq(&rtc_lock);
>=20
>-	return count ? -EIO : 0;
>+	return count;

return 0;

when you are at it=2E=20

> }
>=20
> static int cmos_nvram_write(void *priv, unsigned int off, void *val,
>@@ -671,23 +670,23 @@ static int cmos_nvram_write(void *priv, unsigned in=
t off, void *val,
> 	 * NVRAM to update, updating checksums is also part of its job=2E
> 	 */
> 	off +=3D NVRAM_OFFSET;
>-	spin_lock_irq(&rtc_lock);
>-	for (; count; count--, off++) {
>+	for (; count; count--, off++, buf++) {
> 		/* don't trash RTC registers */
> 		if (off =3D=3D cmos->day_alrm
> 				|| off =3D=3D cmos->mon_alrm
> 				|| off =3D=3D cmos->century)
>-			buf++;
>-		else if (off < 128)
>-			CMOS_WRITE(*buf++, off);
>+			continue;
>+
>+		guard(spinlock_irq)(&rtc_lock);
>+		if (off < 128)
>+			CMOS_WRITE(*buf, off);
> 		else if (can_bank2)
>-			cmos_write_bank2(*buf++, off);
>+			cmos_write_bank2(*buf, off);
> 		else
>-			break;
>+			return -EIO;
> 	}
>-	spin_unlock_irq(&rtc_lock);
>=20
>-	return count ? -EIO : 0;
>+	return count;

return 0;

> }
>=20
> /*----------------------------------------------------------------*/


