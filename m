Return-Path: <linux-rtc+bounces-2173-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F7999B6BF
	for <lists+linux-rtc@lfdr.de>; Sat, 12 Oct 2024 21:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43BFC282C2A
	for <lists+linux-rtc@lfdr.de>; Sat, 12 Oct 2024 19:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1658A185921;
	Sat, 12 Oct 2024 19:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="qHLvsdL/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C1F81AD7;
	Sat, 12 Oct 2024 19:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728761684; cv=none; b=Ej2TnqmD5m9+tcvI7x0G/6erBKHeOnVUtPtYBx1MYD3djSU05YtQlZkKSPwLkqSm1yuoaS+tRJJdS4fqVCcpAdNN8c1/3yB4tTCiAWSuwA2v4pWZnBEOhKugd5rhmQlDiOwhZY7eFo3/KftFzV17GerqR5Lw3OLM1AyUY0JnBzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728761684; c=relaxed/simple;
	bh=Xzh8LSdDSmKjoRzY+Q8KoyXfit0wRItAgB7kTdNOMHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YtqeCcsNhjSDeuEpAsmd2BfNPRevhYn4rI0EPvav+V+cVEkej1UJPZYdBac5XuJJ0qdn3pp/U5wbpcU25eM31T/ENcxCgORSoY6zijd0RHkbw8Fs1OWYnQrkeZO6IsW/wLjhGLtVWSHGNIpmehLOSpr6dDxNjikcPAaXDwzxQ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=qHLvsdL/; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1728761647; x=1730061647;
	bh=xMK/ULefJOKcVOGvdm5HBqtWSL+Yu2XMd5io6AH9Omo=; h=From;
	b=qHLvsdL/v1FYqgmu86vVbwFYku/oHlHUX0OHNgK5MJVgzQQ4DJYyamPrjcQnd4Q+6
	 n7TuJQcOgyU2981glYz3GHjq0rxxF3FO+/og3kQUB6mf34tNZlkxhqE/RisoOyGU4q
	 YsWZwt8DmuLc7jhLXxuCvj40fde3VNjwtZov898DtFlSlnAwTALEm103Pn0dDCML3C
	 f8oTbAmMzIowgiPqS0BXrtk11d3K94hCSJJX2bAX8FY9k2vTFitcyDoLCN5C9ffHSD
	 Q4jJMmSpgZqfcaSdR9FbM/H2HpZvCmoW/P6a4O+cRrn8JvwljMnbTfQr6LDQn1Ow0z
	 ZY22JYbewszXA==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 49CJY5ZO082920
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 21:34:06 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: Lee Jones <lee@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: duje.mihanovic@skole.hr, balejk@matfyz.cz, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [RFC PATCH v2 1/2] mfd: 88pm886: add the RTC cell
Date: Sat, 12 Oct 2024 21:31:38 +0200
Message-ID: <20241012193345.18594-1-balejk@matfyz.cz>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MFD cell for the chip's real-time clock.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---

Notes:
    RFC v2:
    - Break out the register definitions and reword the commit message
      accordingly.
    - RFC v1: https://lore.kernel.org/r/20240920161518.32346-1-balejk@matfyz.cz/

 drivers/mfd/88pm886.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/88pm886.c b/drivers/mfd/88pm886.c
index dbe9efc027d2..891fdce5d8c1 100644
--- a/drivers/mfd/88pm886.c
+++ b/drivers/mfd/88pm886.c
@@ -37,6 +37,7 @@ static struct resource pm886_onkey_resources[] = {
 static struct mfd_cell pm886_devs[] = {
 	MFD_CELL_RES("88pm886-onkey", pm886_onkey_resources),
 	MFD_CELL_NAME("88pm886-regulator"),
+	MFD_CELL_NAME("88pm886-rtc"),
 };
 
 static int pm886_power_off_handler(struct sys_off_data *sys_off_data)
-- 
2.47.0


