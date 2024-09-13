Return-Path: <linux-rtc+bounces-1976-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6BF977D6D
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Sep 2024 12:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89BDA1C249EF
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Sep 2024 10:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DD51D86F1;
	Fri, 13 Sep 2024 10:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="fWWJOR2M"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A0F1DA103;
	Fri, 13 Sep 2024 10:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726223363; cv=none; b=RnScN5n3RK49dzfspVxSPSmU0Ya6QcbkzOgJxONWj6u0bo9I8WXjLYJrXTywRZUjiB7tvN4ueXEchQzFnGmW9DCE6JH+vbXPYjxNE9Zrax6OeM8EvrGZuSxH94MWx/g1OrfV0E6f96hJuiVaBwHnITb4fo67AD9mSeSvkrjQ2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726223363; c=relaxed/simple;
	bh=hFBb0VdmwpJyB7HUscmrPYS3gZMBv/xx+DAEZyA6cH8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uBumnGo3mw2JuvliLocO9pI1W0gMSOksmskGm3nHXubUCWVtjN8qJ/eTzKxwHGgxRF5DXLdc6UJZGe8nC3j0ZJK+1CqHwuDYKmIwsHG9BO7RXq2UOKxdTXVyW1Arib/TetuwPMSpYd2fxkPiNmbgXHaIbg90GTjvXQNdoUIvcZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=fWWJOR2M; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References; bh=oK/HdnIlMYRz/Dd4LIid7y8NEXVq1mgovfXdJqNrshs=; b=fW
	WJOR2M6jE0e1y9xRVIT8HHABoYq7iUmCTMBNs15/tBoV7pKBIYVCimBxhtMT/K2l3j+mBFxUUPh06
	GyvA+Zppwb97hYzwyu5skBQJMe4Xnb8yIEQme3LO9yCt5ceVvfB/rItfKwb0i19sueZE6IHNhrtuS
	sHH4ZImdA4sbPjZNEtALPix2XtImc3F4BupJcuD4FufBvqKl80dHD+2o1ZkjDF2+x3g4oGjrmijif
	o91KEaCteryM8n24YgZ7+mIzS6/jVQ+/eTlaoXBnnOIwAA3m2vkaW5I3lrzcShQmlWKdyNjH0kykY
	DJPwp/qppekQVYX1jryKxh1CnKAJ7AoA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sp3YE-0006OE-0e; Fri, 13 Sep 2024 12:29:18 +0200
Received: from [80.62.117.18] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sp3YD-0006ob-0h;
	Fri, 13 Sep 2024 12:29:17 +0200
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH v2 0/3] rtc: isl12022: Add alarm support
Date: Fri, 13 Sep 2024 12:29:11 +0200
Message-Id: <20240913-rtc-isl12022-alarm-irq-v2-0-37309d939723@geanix.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPcT5GYC/4WNTQqDMBBGryKz7pQkVmy66j2KixAnOuBPnUiwi
 Hdv6gW6fA++9+0QSZgiPIodhBJHnqcM5lKA793UEXKbGYwyN2W1Qlk9chx0Fgbd4GRElgW1rSm
 YslK+JMjjt1Dg7Qy/msw9x3WWz/mT9M/+TSaNCtt7XXlqvbV1eHbkJt6ufh6hOY7jC3RYicy9A
 AAA
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726223356; l=1610;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=hFBb0VdmwpJyB7HUscmrPYS3gZMBv/xx+DAEZyA6cH8=;
 b=EgYQ0iVGlR68umIm1ocJWYEYw6hwjV2CKhufGELtBI5LencQoRpKo+esl5dvJx9c/LEzBhuUU
 cxjFV3Xi/mNAefb25p2/bbvg7sL/2oaspvAbi53SM2INDwak6A2F6av
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27397/Fri Sep 13 10:48:01 2024)

Extend the rtc-isl12022 driver with alarm IRQ support.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Changes in v2:
- Various coding style changes.
- Remove const keyword from auto variable declaration.
- Use u8 type instead of uint8_t.
- Fixed bad return value in isl12022_rtc_read_alarm() error handling.
- Change variable type from int to unsigned int for variable given to
  regmap_read().
- Drop unneeded variable initialization (ret) in
  isl12022_rtc_set_alarm().
- Extend use of DWA0 variable to avoid false alarm trigger also when
  disabling alarm.
- Clarify the use of !! operator in isl12022_rtc_alarm_irq_enable().
- Change isl12022_setup_irq() prototype to avoid the need for storing
  struct i2c_client in struct isl12022.
- Use dev_err_probe() where appropriate.
- Change dev_err messages reporting problems with register access into
  dev_dbg.
- Renamed ISL12022_ALARM_SECTION to ISL12022_ALARM for better use of
  horizontal space.
- Leave FOBATB bit untouched.
- Link to v1: https://lore.kernel.org/r/20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com

---
Esben Haabendal (3):
      rtc: isl12022: Prepare for extending rtc device drvdata
      rtc: isl12022: Add alarm support
      rtc: isl12022: Replace uint8_t types with u8

 drivers/rtc/rtc-isl12022.c | 269 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 253 insertions(+), 16 deletions(-)
---
base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
change-id: 20240910-rtc-isl12022-alarm-irq-197ef2350c3e

Best regards,
-- 
Esben Haabendal <esben@geanix.com>


