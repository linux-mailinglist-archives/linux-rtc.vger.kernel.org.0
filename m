Return-Path: <linux-rtc+bounces-2654-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 636D69E19AE
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 11:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71CED166BFD
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2024 10:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F771E2838;
	Tue,  3 Dec 2024 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="zPA4v7eP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362D71E25E6;
	Tue,  3 Dec 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222758; cv=none; b=D0tUlY2QFgaACd4X/LX5ldGjwjaExjZncYlunyig9ST4UGUnXrRZUt10S+GJ7EtNL7OAN7EEgZnRnfSLc/hAP8s9/NnZqLNM/YKz2wl8fnH9y+fc1045VVXiqZQn1RaWGy6An1lQrefF+C+I8FukJu6Z5PkCn2NrK1W/1CQNbBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222758; c=relaxed/simple;
	bh=IsM5qwXmVYbtpLyfbaWedFs/VMNxgxhIv9ZcK9/X2/Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JkfphaGrCvCIcZ16c3sy4hgbMHbltlW9zpRQVASF08ipUHOu52z4Fs81FdMM73pnqFVCrMAMO/MIUA6kGMm4k2FyQoEvitD4PD4tshYHmputMVo9F/a65q71feej+hQxk9vXTUHKq97fFOvxvl0naT/LbEev3+nlOVh+Iy+EtPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=zPA4v7eP; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=eUOXxza2xZDbeONLJ88WTGExZzUw3RWWcYeyA48yLeY=; b=zP
	A4v7ePAjjTQxnrQjzUzObzLd3YWI1sYezNf+8pFa3iW4WzerQgFaS6p9WWRS8WvvDhatu/O0UHXwd
	QpoNH5WEKTxH/0S4XB1J+5CfC0SVoI/hEb9/Dh9BhxY5Lb2DLjIGnTTfTa14TgApRzy2HdgjflJNV
	cVNRe85XeXKITI3CNsb2pcg5KCqVJhLIdF/3EWG+LZG6BY/dvhk5fuPcjTf0Uv55te0anokbByCx3
	OMFEOW6YGgd+6Pe4I3S2DIyNM4+iaLg/9wHsIkX6mj9kRgWb7mW/q/YAhWikrvqnptPUD2Yh36EGh
	WHnqkYmBJxeOHTEfTNw08hhBk7XrRfBQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tIQPh-0001Oj-46; Tue, 03 Dec 2024 11:45:53 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tIQPg-000L6S-1L;
	Tue, 03 Dec 2024 11:45:52 +0100
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH 0/6] rtc: Fix problems with missing UIE irqs
Date: Tue, 03 Dec 2024 11:45:30 +0100
Message-Id: <20241203-rtc-uie-irq-fixes-v1-0-01286ecd9f3f@geanix.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAErhTmcC/x2LQQqAMAzAviI9W5hVcPgV8SDaaS9TOxVB9neLx
 yTkhcQqnKArXlC+JckWDaqygGkd48IoszGQo6YiV6OeE15iWg8M8nDCQL72rafZBQ/27cp/sK0
 fcv4AkCfcgGMAAAA=
X-Change-ID: 20241203-rtc-uie-irq-fixes-f2838782d0f8
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Esben Haabendal <esben@geanix.com>, 
 stable@vger.kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733222752; l=1634;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=IsM5qwXmVYbtpLyfbaWedFs/VMNxgxhIv9ZcK9/X2/Y=;
 b=4m2rQQdcFWIslwIXR8uaXwn9QhTkD+u/aJnbsc9jpodG1R+miZyhebqDjXFK0hnoSwtvJqSE7
 9r4bEt+i1d/Bjx+kTsuQ7Nc01QvjWyus4rDJ8q5znc+fABJWVbu69NQ
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27476/Tue Dec  3 10:52:11 2024)

This fixes a couple of different problems, that can cause RTC (alarm)
irqs to be missing when generating UIE interrupts.

The first commit fixes a long-standing problem, which has been
documented in a comment since 2010. This fixes a race that could cause
UIE irqs to stop being generated, which was easily reproduced by
timing the use of RTC_UIE_ON ioctl with the seconds tick in the RTC.

The last commit ensures that RTC (alarm) irqs are enabled whenever
RTC_UIE_ON ioctl is used.

The driver specific commits avoids kernel warnings about unbalanced
enable_irq/disable_irq, which gets triggered on first RTC_UIE_ON with
the last commit. Before this series, the same warning should be seen
on initial RTC_AIE_ON with those drivers.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Esben Haabendal (6):
      rtc: interface: Fix long-standing race when setting alarm
      rtc: isl12022: Fix initial enable_irq/disable_irq balance
      rtc: cpcap: Fix initial enable_irq/disable_irq balance
      rtc: st-lpc: Fix initial enable_irq/disable_irq balance
      rtc: tps6586x: Fix initial enable_irq/disable_irq balance
      rtc: interface: Ensure alarm irq is enabled when UIE is enabled

 drivers/rtc/interface.c    | 27 +++++++++++++++++++++++++++
 drivers/rtc/rtc-cpcap.c    |  1 +
 drivers/rtc/rtc-isl12022.c |  1 +
 drivers/rtc/rtc-st-lpc.c   |  1 +
 drivers/rtc/rtc-tps6586x.c |  1 +
 5 files changed, 31 insertions(+)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241203-rtc-uie-irq-fixes-f2838782d0f8

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


