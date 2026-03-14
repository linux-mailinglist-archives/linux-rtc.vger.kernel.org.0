Return-Path: <linux-rtc+bounces-6203-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AXCLOlQtWm8zAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6203-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Mar 2026 13:13:29 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 458C128D100
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Mar 2026 13:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D922A3015EF1
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Mar 2026 12:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86413101D2;
	Sat, 14 Mar 2026 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8rJ3+o0"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B598217BA2;
	Sat, 14 Mar 2026 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773490384; cv=none; b=OT1nExdDMwwvjRCFLbaux3ryhgynLgaC+dSr8Q6jSA+4OurUPDBqIyCNn8QTvaa9c5HcnE1Iwd3EwBRegxEqXYrgSjTOemIKc6oReWgOWJFKw5lWODKeH7V9CU26KblmpgvhOehmSRbaN8gFeAmnkNySz6aiLjh1jp72q4JZCEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773490384; c=relaxed/simple;
	bh=exp/QyUP4fvmfORMpkkf1BnTMB6aMqlA822wWMTgyUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cP7qEUxaaSWXna/TwuOHO93hE+RrAj6yHbuhQUmWLZjzcBGdLLuczEaRe47/CzxGbFwPGm961SiKuzC+pMqoKAeGojqmsy8AZa6Z+chmgvOqaIheJVhvKT7PjDxOh0di3fte61A62fji+2r6huA6XUtc+l5mwfl1mlgx0iV/FVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8rJ3+o0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C60C19425;
	Sat, 14 Mar 2026 12:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773490384;
	bh=exp/QyUP4fvmfORMpkkf1BnTMB6aMqlA822wWMTgyUE=;
	h=From:To:Cc:Subject:Date:From;
	b=Q8rJ3+o0E2ej1ahsZOCrw0TfzPyRcQjsgI0nr7OUHEBDIoPCvlOaP/x77PXSOGF+I
	 9WFUUAZOfV2o8KfPvYY1MGPeTDtYG3iIgSrHs3r4xhMapffO2MVw4o0vVW3fIDwkyl
	 OxFGO7U2IeiTN2pSQMps0gYYmzn8RkSSfqqrXw1kbQESBUArBfuYwpZJ+W/4yanm4l
	 eFK8mV1qDcjRIejadBwhn8qD9MHnzsX/V8c/jzhiSlUVc5BYA/G4UzJyrJfLve0i0n
	 QSPM5dOHKV1wpmajXs0mixQLjbnCJG0ytulitGaw/STcP32l2HvJYlI9q9HJr8DNU4
	 QDZmbwXcxy1dQ==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: linux-rtc@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v1 0/2] rtc: cmos: Do not require IRQ if ACPI alarm is used
Date: Sat, 14 Mar 2026 13:09:21 +0100
Message-ID: <3964452.kQq0lBPeGt@rafael.j.wysocki>
Organization: Linux Kernel Development
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	CTE_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6203-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rafael.j.wysocki:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 458C128D100
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

This series of patches allows the CMOS RTC alarm to be used on x86
systems that don't include a functional HPET and may not configure
an IRQ for the CMOS RTC, but have a functional ACPI RTC fixed event.

The first patch allows the ACPI RTC fixed event to be used on systems
without functional HPET because there is no fundamental dependency
between HPET and the ACPI RTC fixed event being hooked up to the CMOS
RTC.

The second patch changes the driver to stop requiring an IRQ to be
configured for the alarm functionality if the ACPI RTC fixed event
is use for signaling events because it require a separate IRQ to
be requested (the ACPI SCI is used for event signaling in that case).

Thanks!




