Return-Path: <linux-rtc+bounces-6734-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +3slNFGqO2oTbAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6734-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 11:58:41 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4876BD1DE
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 11:58:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dkaUqR50;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6734-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6734-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52C8B301AD0C
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 09:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304673ABD83;
	Wed, 24 Jun 2026 09:54:35 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14213B0AC7
	for <linux-rtc@vger.kernel.org>; Wed, 24 Jun 2026 09:54:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294875; cv=pass; b=GRgirnddy3Z8Y44evrmokfcRvp6gbNrGciwu6nacxeppwwCqJUJXTvIxL3LRjhzXL4600kgYDEFZJMNurVcBTiSbgYVu3a3TbW6d/7WwqdnKzclF2geVNVmjimR/8gAlHpVGps052F0H2eYLyd+CW+c2U26/W7L+YaU0AQlXmvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294875; c=relaxed/simple;
	bh=G7McnGzDAgC/O+5kkADtYO2MXqBKflAE5Es+/QUD2pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1W1QwF1ak0gSE29BOkzd/b89VVlJS8l7mr9ST7/JCPsjEmyhC9+IdIsb8nbrZlwQN7ANn1l1SGEfckqx/NDXeFTQ73HExH0+T5qfdUdkYsxsGKEPzkAgEaedYbvNMSMbOVsoPfQrLen07/Z/p88gaPYmUk9BwGRIm3EzI3A6BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkaUqR50; arc=pass smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso5804855e9.2
        for <linux-rtc@vger.kernel.org>; Wed, 24 Jun 2026 02:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782294872; cv=none;
        d=google.com; s=arc-20240605;
        b=eHUfHCqcSlUPbN5iWF9en+hHenix2aNWQJAZuFfxc6UvrrupzRZWNcDu9/dBMyyNp3
         2GkqxX2cOXj5tzazxi5u+zy+CjXLPzN9DU2k5248Il/6EF1eXN22dZfOjtOx7Q2t/Tej
         q+SVRECqzBNSK4ijsj8W4ULb4JBS6Lj0HxZz2vPYEkQBim9O9VnnnbOaSpmCUIPvZn+S
         xUZrIWLa2eNkveJdYAvpYCzr1mBDEj6NHN6jBmTFYkbu3slZCAgr3YPpI9sZHSwarQtd
         aw4AAcKBWCSYEObFSKHH27sTTh4HdOoo2LZw/lbf0z0HMB87YY7GF9J7DSZCKL5XayBt
         CHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ObqsI1pCoD4Da2/XxZ9CqBQX9rgxlXpIUEI/2gcibd4=;
        fh=UPtb7LfIm4chHMcbyqT0XKNE43cfRQCqDGJn8t4CdDU=;
        b=YZotpjcHXcnwQjrz2fKBpARdmH+DbP9Hs/iK8xOin9+bY1lYIBqIg9NyHu2YyGTlnS
         /88tx1vFsjKmw0YONoUBg8rUtHkqoDl7QSZ5wPr+o767+1esJVW9xOZgWk7TpL39+Knh
         MMWsuge7HA51pCBUB6D/WKWZNOY3njwzilkpqQSco9RjBL+o1P5FHPttlHmu5lZWQRBp
         i1PE6wAkmNDmcjiCe3kKslHCnsLVMg/Ffh4Sm5VxSPFaXU59CA/kG7oplCP1nwp+ltG2
         zzIuuKFSsZsL3ZluCBTbnmAGnwSC+Lebg7fBjEgCQS9rlQoMyPk+ihn3TDXS0MqwXtTl
         TQrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782294872; x=1782899672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObqsI1pCoD4Da2/XxZ9CqBQX9rgxlXpIUEI/2gcibd4=;
        b=dkaUqR50YTZlxtCAx72UdCM1RH7NxEvldd4TstWF1bQfzhwsIGA5bTSrQcByQCnqeH
         BIIquIz6sNMxeFubAAidHW/QfDgoBe6Se7/8lF5u448nmE6khdBcO3gh5uriBlcwSaV7
         dfnICjm+uf4oojzQjqINbkvK7GgEMrC/l+jam2jYd9++VcjD+Jr/msTMtT5u5Llv+AfM
         ydw9vr1SWMIRBub6Fnr+I0me72Z+1fLlVN3jr2PPwqC+8GL5b58Z8XycFO6L09UsOGdG
         BcPXuS4UsgRJbVZLO65YTVbaVAQ0pp+ALyCejnmhJY4ZR+bPb6s9VRCjxe6OuaO3kQ9V
         Zz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294872; x=1782899672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ObqsI1pCoD4Da2/XxZ9CqBQX9rgxlXpIUEI/2gcibd4=;
        b=Qg0b9ot8NkJmNrKHi8UjeE1VRqgT57WbFXBibS4d254jJfBOeC73CRybdaVG2Y7yiE
         9wzEoGtwfX0YrnOsbaAtJHBwFoe4WtaYxT+LZ2qkC9uuTNywTUAUqX0Y4bNXVSQkFeU9
         dhBz/WStaIR8+XoITgJvx9GYDRCGKOOda4g+DSVtaImqpRl9QZKrkh1Jwql0dQEQRQjH
         l7GTGmMdqHi5L41MNiIi10AKRrFinrL5rzrxbhoGtvPRwvK0VNY51IuUMkZMgWOcuJfq
         TWZyb1f4Pt67efwdii2GrTMPt8G5rPnSFs1Sjux+7a3XkLetUyFr77g8LG65K6MyQeah
         979w==
X-Forwarded-Encrypted: i=1; AFNElJ8bfEfQrFR5qOpl8+nWOYtyjrBp4xy1YWxmPnLvSOqLshzpqiaxDWGJCRE1jPbgBg6No22+Z8GHv1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMRy9ziZoQou4sLrDCTGiNuf+emlL30RSjTQMc/tW9/nglBJ/C
	hj2iQHNbJsPBlUGBxd1qWJuUhQEU2fi3vXVvYbiK8JtNBgL1QBb4L9kD8V9O7ajVvg/xwz03AB+
	dvBjrdjrmK8s7TOBndn/Ii6QFsRv/EYUEaxB3KdNOxw==
X-Gm-Gg: AfdE7cleX3kdd+lqXo12WximtGFwvFZOtlS10nSNOg78ptoy6oDH018I/6ko4EbHzOY
	IVbSVRObeyhKfLtk014eOGhDXiT+nFyfXfmeZ6azfqHbuGKT/kQumwUOw2N9bf+Z+ET6+hNDGV7
	kO+Xh9UIfoYY8kKaqh2ZvdQNVLGZklC7GKyEKldPL0+0YsJNoCZW3j0z8YGYvSuBq32BTDPqpF+
	v9glC5Xjh7g9jILLgq/RtYAiNmzS+Ksu2ycEy5TRfxTGSDj9lo/yCzbfhmGwsVJErFluC6WtwS/
	4tWijZP4I6Ihm0mrmzknTYF5ec1mFnPT76B77uQbarDpeFSs7AXrQEqiu7CB
X-Received: by 2002:a05:600c:4f93:b0:490:3f7a:108b with SMTP id
 5b1f17b1804b1-49260852341mr31752025e9.16.1782294871891; Wed, 24 Jun 2026
 02:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ajJ9kNJtrY6DyQ-S@shikoro> <CA+V-a8u2wt6623mYjhipOvJPo4va+bXs3qirQewocFr2QmUFhA@mail.gmail.com>
 <ajr1wXCI2U23d1sY@shikoro>
In-Reply-To: <ajr1wXCI2U23d1sY@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 24 Jun 2026 10:53:53 +0100
X-Gm-Features: AVVi8Cevqm9oqdlggQH1rMr7Spj8hW-dVFTCrlA4kct0_6oDoVWBpLIfXWaxx4Y
Message-ID: <CA+V-a8tfb5YFsh-K5F8OOBsuJi0PG72vQ=2PQb2avVNF8-kcrQ@mail.gmail.com>
Subject: Re: [PATCH 07/12] rtc: rzn1: fix alarm range check truncation on
 32-bit systems
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6734-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sang-engineering.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D4876BD1DE

Hi Wolfram,

On Tue, Jun 23, 2026 at 10:08=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Can you please share the commands you tried, I'll try and replicate it
> > on my side.
>
> Sorry, can't give you the commands, just from my head: I tried to set an
> alarm more than a week in the future, and the alarm was set to the next
> day. But I was in a hurry, maybe I overlooked something, because that
> handling used to work in the past IIRC. I can return to this topic on
> Friday earliest, sadly. Maybe next week only...
>
I ran some tests for cases #1 and #2, and we see an out-of-range
error. By adding a 1-sec leeway when checking the ranges I don't get
the out-of-range error. Let me know what you think (I'll create a
seprate patch for it).

Case #1 reverting this patch:

root@rzn2h-evk:~# date -s "2026-06-24 10:34:00"; hwclock -w;
Wed Jun 24 10:34:00 UTC 2026
root@rzn2h-evk:~#
root@rzn2h-evk:~#
root@rzn2h-evk:~# rtcwake -m no -s 604800;cat /proc/driver/rtc
rtcwake: set rtc wake alarm failed: Numerical result out of range
rtc_time        : 10:34:32
rtc_date        : 2026-06-24
alrm_time       : 10:34:33
alrm_date       : 2026-07-01
alarm_IRQ       : no
alrm_pending    : no
update IRQ enabled      : no
periodic IRQ enabled    : no
periodic IRQ frequency  : 1
max user IRQ frequency  : 64
24hr            : yes
root@rzn2h-evk:~#

Case #2 with this patch:
root@rzn2h-evk:~# date -s "2026-06-24 10:46:00"; hwclock -w;
Wed Jun 24 10:46:00 UTC 2026
root@rzn2h-evk:~# rtcwake -m no -s 604800;cat /proc/driver/rtc
rtcwake: set rtc wake alarm failed: Numerical result out of range
rtc_time        : 10:46:30
rtc_date        : 2026-06-24
alrm_time       : 10:46:31
alrm_date       : 2026-07-01
alarm_IRQ       : no
alrm_pending    : no
update IRQ enabled      : no
periodic IRQ enabled    : no
periodic IRQ frequency  : 1
max user IRQ frequency  : 64
24hr            : yes
root@rzn2h-evk:~#

Case #3: Add 1-sec  leeway:
root@rzn2h-evk:~# date -s "2026-06-24 10:48:00"; hwclock -w;
Wed Jun 24 10:48:00 UTC 2026
root@rzn2h-evk:~# rtcwake -m no -s 604800;cat /proc/driver/rtc
rtcwake: wakeup using /dev/rtc0 at Wed Jul  1 10:48:50 2026
rtc_time        : 10:48:49
rtc_date        : 2026-06-24
alrm_time       : 10:48:50
alrm_date       : 2026-07-01
alarm_IRQ       : yes
alrm_pending    : no
update IRQ enabled      : no
periodic IRQ enabled    : no
periodic IRQ frequency  : 1
max user IRQ frequency  : 64
24hr            : yes
root@rzn2h-evk:~#


Changes for case #3:

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 173526d50d41..8fdb5114a6d8 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -279,7 +279,9 @@ static int rzn1_rtc_set_alarm(struct device *dev,
struct rtc_wkalrm *alrm)
        /* We cannot set alarms more than one week ahead */
        farest =3D rtc_tm_to_time64(&tm_now) + rtc->rtcdev->alarm_offset_ma=
x;
        alarm =3D rtc_tm_to_time64(tm);
-       if (alarm > farest)
+
+       /* Add a 1-second leeway for processing delay */
+       if (alarm > (farest + 1))
                return -ERANGE;

        /* Convert alarm day into week day */


Cheers,
Prabhakar

