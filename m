Return-Path: <linux-rtc+bounces-6599-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PnJOb5OHWrDYgkAu9opvQ
	(envelope-from <linux-rtc+bounces-6599-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Jun 2026 11:19:58 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BE361C44E
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Jun 2026 11:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9450930117A1
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Jun 2026 09:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55B1361DC0;
	Mon,  1 Jun 2026 09:14:20 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53778385D88;
	Mon,  1 Jun 2026 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780305260; cv=none; b=CkqFujiU2Q2WDIEEcDwpHYD59fswE98zIQZewRIhLMLjy8vULG3wjnFXALc31fMYAtIh9cfniEHqIooPP0K6yUA25KJGP+M9izGrKINF4GKo1Y6tTPd0wfawIrwcGFMfcRcUS0BlxpC+32Fs5paca6MTgKjrDjexYv3sN6B29ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780305260; c=relaxed/simple;
	bh=BIVqZiBYz0UJFJj0e/Ht6rWfSBtx/Fyk2CN8Z7NBoqw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=KjVv6w82/VsVMt+Fwrftf1Mf+C4FY5FM/LUSdmhi/ONPmzY0VWLMKJVHOUMcDyOZfrcxPG/1q2aFqAC3Re2puJfgw+E+kZYU1DO2m88gtdcBJpnnfNOrIhpvLaUOkIWNs4nYLOXjb/j9Gfi/x1uCPgHs1SP/vFoDFC7ClRresbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Jun
 2026 17:14:10 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Jun 2026 17:14:10 +0800
From: Tommy Huang <tommy_huang@aspeedtech.com>
Subject: [PATCH 0/2] rtc: aspeed: Add AST2700 RTC support
Date: Mon, 1 Jun 2026 17:14:05 +0800
Message-ID: <20260601-ast2700-rtc-v1-0-15d4ca46500a@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1NHWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwND3cTiEiNzAwPdopJk3RSTxJQkU8MUI0MTCyWgjoKi1LTMCrBp0bG
 1tQD52m9pXQAAAA==
X-Change-ID: 20260601-ast2700-rtc-d4adb51d2148
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, Tommy Huang <tommy_huang@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780305250; l=637;
 i=tommy_huang@aspeedtech.com; s=20260601; h=from:subject:message-id;
 bh=BIVqZiBYz0UJFJj0e/Ht6rWfSBtx/Fyk2CN8Z7NBoqw=;
 b=k+dRNdw4ySTci6bzre+yAKaseUFPXui2dpoGU5J7TDjLJOtLdZMBf13b3+uyAeFodlxfG31+p
 UVXjbQSHHl7Dpg8yNLgXtNHBc6e02DHP6LdIkxtAgbTYnHpWIlvAp67
X-Developer-Key: i=tommy_huang@aspeedtech.com; a=ed25519;
 pk=/SRU8iPtlyPCtlX7hXjYJhOTpCUdfEZ9pIVVyCQOjLE=
X-Spamd-Result: default: False [1.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6599-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommy_huang@aspeedtech.com,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,aspeedtech.com:mid,aspeedtech.com:email]
X-Rspamd-Queue-Id: 50BE361C44E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds support for the ASPEED AST2700 RTC define,
includeing dt-binding in the Document and rtc-aspeed.c

Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
---
Tommy Huang (2):
      dt-bindings: rtc: add ASPEED AST2700 compatible
      rtc: aspeed: add AST2700 compatible

 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 drivers/rtc/rtc-aspeed.c                               | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260601-ast2700-rtc-d4adb51d2148

Best regards,
-- 
Tommy Huang <tommy_huang@aspeedtech.com>


