Return-Path: <linux-rtc+bounces-6572-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH2+F68HFGq6JAcAu9opvQ
	(envelope-from <linux-rtc+bounces-6572-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 25 May 2026 10:26:23 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F38E05C7B8A
	for <lists+linux-rtc@lfdr.de>; Mon, 25 May 2026 10:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F7C13026C34
	for <lists+linux-rtc@lfdr.de>; Mon, 25 May 2026 08:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC6C3E1D05;
	Mon, 25 May 2026 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbdoETWZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F713E16B4
	for <linux-rtc@vger.kernel.org>; Mon, 25 May 2026 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779697275; cv=none; b=RSr1qTJgmarQ15Hq12a+TNvgatWRxSFiTGL+fQ068zTr+p7CIfRdkbV9nsYc6dNvR4DGo7OIwEOMNT+Afbf6PpqIOWv4aSTtYAOXTKHu8rRdUDfIQC5zMzr8cWjHp9ovLPRHDnEY8lme51vPzBbV17goQC2TYTYLfWCklTJIsoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779697275; c=relaxed/simple;
	bh=cnpeNyrRTMfn71Iw1My7ZiOgcb+W5DMHV+tEtk3Jprw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j9p0z2NcpVZ0UwqvKl8Z2xTH6Jz7OM3P987aGXBsTqfFGeDLI4n8NI+rubpKTBBUw28E7rYpTuLrKuiSkJfZ7+NrkDoe9WlSLbDVw8hCyR2jMr/GV0zllTBNDJ7vUrsdLRrAPVe77ZBuPFk8ogpLockEcop/5R/nEjRxNKGpanM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbdoETWZ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8027e876fcso3883626a12.1
        for <linux-rtc@vger.kernel.org>; Mon, 25 May 2026 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779697272; x=1780302072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h73HPPR4b8cE2zhlXM66PdYigBOxMozGSruLRQEyEiQ=;
        b=MbdoETWZnVu54cAdDYI+IcH7dP3KiMFUYIRxUXnG2Ab/xV7Ss0URUFR6Odm+pBRpqf
         PekTC9McdvzdVJcyapSELOrilu+qAdhIZMQkgfX3bzBJJlSpBT6lOJBe5RnBY06WK+t2
         XcXOt6hEq2rJaZMJP1daWYE41gC3xYCUUWXRW9vF3PdL7iu5fQyrjtJypt/BqxaRC2nl
         ltjyta0KdmPnzj7zUjF65Er4+TvQHtZi3QA19E1SbY1lC9pjbtnhxyP5GQQTFBDbLZcw
         D0wII5njH1rwFNM3iByK1cDPDckSOx6/yR5JW5IADz2NYgTq+koaLTdKR4mlCbSeRsuj
         1bJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779697272; x=1780302072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h73HPPR4b8cE2zhlXM66PdYigBOxMozGSruLRQEyEiQ=;
        b=W7MLRrNgTGx3MKF/LQyccVdRVfJjZCSxXgjgODHX4fAPy8gxdVa6Kv3iuSP/vgL0N/
         vZaFDzdikUy62HFlGRliMsq6ysCqCjYm6zZiYz09k6aMHXMHmAUxT/m/VCKRQzZLaQko
         WUECyd4c4I0JntMWOq9tJY2gjHNTgqYyjD0UcQZxXcU4tHVfxaJNnQ+kYjG1RYml9b7v
         TBiE33k3olHBLLYpfZFZe/MC/yXEqfdo0FpVJizK9sV4erO/fmlvZqAG4BBIjCpTGkrC
         yZBI4adYHo6+PCOchJQddN/noSCgVG/hhpJfL1n73EDCI1Dq8pnCCo3QmJRW1iaD5nQv
         LsRg==
X-Forwarded-Encrypted: i=1; AFNElJ/kiOu3WWbizyj6tLSViCQoc6yMXckpxpruQCAI1R9+KsLUuqAFvKHpHzzG1sM6Udc7P0qVSqkYhKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rzYV1YWYkR0N740fEWLN1AEJddpnhFmExqbwn08JeU5OjZ6m
	/JKMY/m9VjZUEjdNOOHqGH5Peop+UDlptTeDhihajdxh7NKjR/gALqHf
X-Gm-Gg: Acq92OGWIoXCz6YCcHLNJ0KW6P23GelUZ/eUn4AH+jM9lpLCf7vM5FFemWuUIFT2Eo+
	vEP9Kv0XVVDaqP9NVHgPH5muyYr+7bSjYV4DEYXrNCbypDyJqbAgeSE7FFgsnNiw4YnZ2wySGsj
	WEeNowG6X4mNSdEo1ui2MO84eerByug7MaUn61o6XM49yVaeMAj+ftxczXaLZ9+9Z/etJ6hXbCZ
	lfJB2b4PksBfk78j80d+Y+xIE+99XB/vLeyZ+Asm+0LGjdhM2VtWLRAwSGTRHMN4YidR3westAK
	WIH6E3SZe4o5VSoJsGWF4vj1ONv7D1P/S4nrM4wI/wwVWAFBVMnEQdxyzxb83kXAYfebWiejDmt
	UAFKKPgdbdus5UXnAQVwDC5rxnYLRx0grXfO6GenwWON+xQVLFMtCRl7nvhn07BqFOGWzcE4cxW
	mc09CsK/5vyx009BMYfyKqycy4BKkKQBUc8VFGJ/k4sAvy50xZ88FSUXvV9ItngKPrXQ==
X-Received: by 2002:a17:902:e74b:b0:2bc:7d09:dcef with SMTP id d9443c01a7336-2beb06bc155mr153249445ad.29.1779697272248;
        Mon, 25 May 2026 01:21:12 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b3bb6sm88798165ad.47.2026.05.25.01.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:21:11 -0700 (PDT)
From: a0282524688@gmail.com
To: tmyu0@nuvoton.com,
	linusw@kernel.org,
	brgl@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	mkl@pengutronix.de,
	mailhol@kernel.org,
	alexandre.belloni@bootlin.com,
	wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ming Yu <a0282524688@gmail.com>
Subject: [PATCH v5 0/7] mfd: nct6694: Refactor transport layer and add HIF (eSPI) support
Date: Mon, 25 May 2026 16:20:49 +0800
Message-Id: <20260525082049.2906283-1-a0282524688@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-6572-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0282524688@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F38E05C7B8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ming Yu <a0282524688@gmail.com>

The Nuvoton NCT6694 is a peripheral expander that provides GPIO, I2C,
CAN-FD, Watchdog, HWMON, PWM, and RTC sub-devices. Currently, the
driver only supports USB as the host transport interface.

This series refactors the NCT6694 MFD core to support multiple transport
backends and adds a new Host Interface (HIF) transport driver that
communicates over eSPI using Super-I/O shared memory.

Changes since version 4:
- Split the monolithic refactoring and HIF support patch into a series of
  smaller, logical commits to improve reviewability and adhere to the
  single logical change principle.
- Decoupled USB-specific data into a dedicated 'nct6694_usb_data' 
  structure.
- Abstracted device I/O operations by introducing 'read_msg' and 
  'write_msg' function pointers in the core structure.
- Renamed the existing driver to 'nct6694-usb.c' to strictly identify its
  transport boundary, alongside Kconfig/Makefile updates.
- Extracted transport-agnostic device management (IRQ domain setup, IDA
  initialization, and MFD cell registration) into a standalone
  'nct6694-core.c' module.
- Added the 'nct6694-hif' eSPI transport driver clean on top of the new
  core abstraction.

Changes since version 3:
- Remove redundant module type macro definitions from sub-device drivers
  that are now provided by the shared header <linux/mfd/nct6694.h>,
  fixing -Wmacro-redefined warnings.

Changes since version 2:
- Restore per-device IDA and mfd_add_hotplug_devices()/PLATFORM_DEVID_AUTO
  to avoid child device ID conflicts with multiple NCT6694 chips.
- Validate irq_find_mapping() return value before dispatching IRQs.
- Check superio_enter() return value in nct6694_irq_init().

Changes since version 1:
- Reworked the Super-I/O access helpers.

Ming Yu (7):
  mfd: nct6694: Move module type macros to shared header
  mfd: nct6694: Refactor USB-specific data into nct6694_usb_data
  mfd: nct6694: Introduce transport abstraction with function pointers
  mfd: nct6694: Rename static I/O functions with _usb_ prefix
  mfd: nct6694: Rename driver to nct6694-usb and update Kconfig
  mfd: nct6694: Extract core device management into a separate module
  mfd: nct6694: Add Host Interface (HIF) eSPI transport driver

 MAINTAINERS                              |   2 +-
 drivers/gpio/gpio-nct6694.c              |   7 -
 drivers/hwmon/nct6694-hwmon.c            |  21 -
 drivers/i2c/busses/i2c-nct6694.c         |   7 -
 drivers/mfd/Kconfig                      |  38 +-
 drivers/mfd/Makefile                     |   4 +-
 drivers/mfd/nct6694-core.c               | 136 ++++++
 drivers/mfd/nct6694-hif.c                | 529 +++++++++++++++++++++++
 drivers/mfd/{nct6694.c => nct6694-usb.c} | 185 +++-----
 drivers/net/can/usb/nct6694_canfd.c      |   6 -
 drivers/rtc/rtc-nct6694.c                |   7 -
 drivers/watchdog/nct6694_wdt.c           |   7 -
 include/linux/mfd/nct6694.h              |  63 ++-
 13 files changed, 821 insertions(+), 191 deletions(-)
 create mode 100644 drivers/mfd/nct6694-core.c
 create mode 100644 drivers/mfd/nct6694-hif.c
 rename drivers/mfd/{nct6694.c => nct6694-usb.c} (62%)

-- 
2.34.1


