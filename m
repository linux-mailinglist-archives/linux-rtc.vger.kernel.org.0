Return-Path: <linux-rtc+bounces-3553-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8637A68A82
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Mar 2025 12:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD48E188C1D4
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Mar 2025 11:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF98A29;
	Wed, 19 Mar 2025 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KAi18jMW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DAC2AEED
	for <linux-rtc@vger.kernel.org>; Wed, 19 Mar 2025 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742382196; cv=none; b=amMJYk3Y7HYbAfXcfXDNsimb3L5g8VwK2Zsq3y2M988jUYxYsUQcSpS3jbBN9HnE3+oeD3+vogNEjSNzcLEreG5kOj1I8n/z6rAUUOweeUGFxXKus+tpWaNn3HDQATW8pvHF3+UM+Y8Xzq8Othjwta4gv4uPjIpFUHOakQlfyd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742382196; c=relaxed/simple;
	bh=S0NdtVpZHj4pWU+kptP8sJXiB1JXW4x9nTNLj1wM0dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ulBXx7xLtRzWxbyK2Igdi8B1wiwa2hZKyJjOM2ZacQxqGAMkeNjtT/3jeJP2uU0LP/g3rrlRJKJZdsysPJDo60QSZpIiKiugik3Sni0FGf9/rHJhGRJ4Ux0UqeK8Z/FDLvpvDEYbFdCecUJWe5vAGXkYfRFgPFbmficdbR60vuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KAi18jMW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=P9e5eoXbJY/fdh
	DICQHdVELnRavwSH2SOD4mWamxVJ8=; b=KAi18jMW9nB3DZc+8aFkK+mU7W5Q40
	Rrv+USEnWIpCT5cbNaBiHL5+7X3Zf13fR51b7IEKf5oZHE4hsFjlsrtwo7dymGSl
	1Qx4WsgWu8y0jRrq0OptdXicr4KP8Xx+K5hqrj7LYP77q4szhZZWK3qm/7kd/Jjn
	fGvi9Wavz9pHKz95K9JtFwT0lRsTMYT1j3GW+7llcS1UDiIW7nXmCQv6StcXMNcE
	fdkheh2frOS1qjEBUb28fn3LxNN96M83griUB92y5cefX3RXxRx61oVEXa180g4c
	o87FMXc51oq3jRruI0vmEXUUyQ5FPLhKSi5fqCpva+CfVpd/PS1sUxCQ==
Received: (qmail 81744 invoked from network); 19 Mar 2025 12:03:11 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2025 12:03:11 +0100
X-UD-Smtp-Session: l3s3148p1@q4aS968w7rwgAwDPXyTHAJp038nK7dx+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-rtc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] rtc: rzn1: support XTAL clk and SCMP method
Date: Wed, 19 Mar 2025 12:03:01 +0100
Message-ID: <20250319110305.19687-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far, the code and the binding for the RZ/N1D RTC assumed an input
clock of 32768Hz, so it was not explicitly described. It makes sense to
do this, though. For one reason, clocks with other frequencies might be
used. This RTC supports that via the SCMP counting method. The other
reason is, the upcoming R-Car Gen5 has only the SCMP method described,
so we need to use it there later.

This series lets the driver handle the optional "xtal" clock and switch
to the SCMP method if suitable. It has been tested on a Renesas RZ/N1D
board with hacked devicetree values.

A branch with updated DTs can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/rtc

Looking forward to comments!


Changes since RFC:
* add binding tag from Krzysztof (Thanks!)
* new patch to disable controller before initially modifying CTL0
* cosmetic changes

Wolfram Sang (3):
  dt-bindings: rtc: rzn1: add optional second clock
  rtc: rzn1: Disable controller before initialization
  rtc: rzn1: support input frequencies other than 32768Hz

 .../bindings/rtc/renesas,rzn1-rtc.yaml        |  8 ++-
 drivers/rtc/rtc-rzn1.c                        | 59 +++++++++++++++----
 2 files changed, 53 insertions(+), 14 deletions(-)

-- 
2.47.2


