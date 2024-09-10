Return-Path: <linux-rtc+bounces-1918-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD2A973360
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 12:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04B801F233AE
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 10:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50A31917E5;
	Tue, 10 Sep 2024 10:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="rRjmT2nU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D0718C003;
	Tue, 10 Sep 2024 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725964045; cv=none; b=mxMenOX3AyypNqs7x9pI0Ow1At4TY4UYK+DuZuQnnuBCAONp/tR1nik6ofvy07nN/VAOoAN5bvsBtjkksPfhs923aQFJn5jAEtSCYwK4AS8YyYuuWCuowg2mluMzHjywjapgzoeVtw0I3Y4oifPx7GPZnuxuEUWBR4YrkolaL0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725964045; c=relaxed/simple;
	bh=zQ60sYw/ULc9GCcIsijISCeXMb6q+ZU0FK/dK+p8GPo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s8bA+2rWfWRkmYdD/ii8ykFJJWrecQd1Mb+47UxENbBwXgMRHbUXVZMN+5FKkeeVJOwujWCCCEJ4VlU55NUlJxsB2SeLvmMAzUH26fL8jgM5yEQ4qPTKi6gSRLEkYIA2UvsnqBoXlUzC0PSK8k3cCK8hGey0YpEoQzicTEY+9Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=rRjmT2nU; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=+HaxryfZ7laLpDSnmw9UhIH/skG7Uhfct72eBQYaJFc=; b=rR
	jmT2nUUxjX7ey2peVmAS7C/CRmAZzPYvBla/u2wXfumZyLT3rA1mOpwngQvlgX3YoQaOI8mWhtkpP
	7aYwszqeJeVA+8M24WynSNdF0brcCKRJNKDljM9stsNItLFWv5wu0BFnRPOPhZCM8JmMrcxwTlPnN
	Yef1N91HPl10euBh6xjtGMr29jX9vx3UguHxcTk3bIFsOWWUmqWhU7+kdMDgstDbmpx7RpsHYsq76
	x82n5b2/YzVDIr05yJPF3XIfoKxRemgDIVuXztsM8RyWAyIKF4oNX/hJu9bdX5uF1jIfRAZjDIIIa
	RGZrSUxEwckLCiZAtzG2zuLSJOtwNXIw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sny5g-000Gru-9w; Tue, 10 Sep 2024 12:27:20 +0200
Received: from [80.62.117.18] (helo=localhost)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sny5g-000Me5-1u;
	Tue, 10 Sep 2024 12:27:19 +0200
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH 0/2] rtc: isl12022: Add alarm support
Date: Tue, 10 Sep 2024 12:27:09 +0200
Message-Id: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP0e4GYC/x2M2wpAQBBAf0XzbGovJH5FHrY1mGIxKyntv9s8n
 lPnvBBJmCJ0xQtCN0feQwZdFuAXF2ZCHjODUaZSrVYol0eOq87CoFudbMhyom4bmoytlbcEOT6
 EJn7+cT+k9AHR0mUxaAAAAA==
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725964039; l=550;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=zQ60sYw/ULc9GCcIsijISCeXMb6q+ZU0FK/dK+p8GPo=;
 b=VWnAhnO9kImINKmgCdYT0G/RXTIZOwQ3qm1iHlPp3p4bcQdtU7g7Bxeu8SNc4COsEkd9k/xPw
 LszDCr+GBswCGcDwEhoIvNoBeU+lqLgcxZMWCF4ARIIfpeCsVIiY379
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27394/Tue Sep 10 10:30:36 2024)

Extend the rtc-isl12022 driver with alarm IRQ support.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Esben Haabendal (2):
      rtc: isl12022: Prepare for extending rtc device drvdata
      rtc: isl12022: Add alarm support

 drivers/rtc/rtc-isl12022.c | 275 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 265 insertions(+), 10 deletions(-)
---
base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
change-id: 20240910-rtc-isl12022-alarm-irq-197ef2350c3e

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


