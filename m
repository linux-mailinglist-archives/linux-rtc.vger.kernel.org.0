Return-Path: <linux-rtc+bounces-2601-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 429BD9D5D0B
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 11:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF7541F21350
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2024 10:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479F91DE4D3;
	Fri, 22 Nov 2024 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HV7gS1ai"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AF21DDC2C;
	Fri, 22 Nov 2024 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270238; cv=none; b=fcDDO+KNNAbT9sz0jAIbn+UGg0gqm6p1sNa753n/1eTFsn1cuinqMjrlUUZE6YQkZDlPoBfECUCxUeI2VtBVQtqT5dIOr5X5zamKFADSdwMqWejCgRFqTNSGKUZYAOQyw0iCI+bpUbhqF/EcLwcqn/TYOmx9n3MR0eTfy4Z0Ta0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270238; c=relaxed/simple;
	bh=KRgOHhAIrB17XjQ8L3eDQY77oU+TmRSFzAgCayaYfJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/HzHgo4UQrbq/pD7Ma78r55jTuUo6KbK/cKV+oSB6v0LOYhW7Up8hcYu5JtQn89JmzAWdP0+iv1pIhcUp8y/wF7J+YNGHJtRT6xZwy1NjUJUnXQWxgxwpHGGJMa7HVUIK4hQCFOcQJyN2xBXP007T+m5hJejFBbQpyHT8CLeyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HV7gS1ai; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9719FF807;
	Fri, 22 Nov 2024 10:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732270234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DPWLo1RyoZwyHr2GUU0wsJyvpCze8Z30Q7ubK/iwmaA=;
	b=HV7gS1aiEDqVeF+W9IGcDKX2bFK0pr39JfitlwnJNp5aIv4GLLcl45B6SuSkOUhFWHKlmp
	PZzsGDXzkm/jJuKBdPxqOxQOcfBrV6dsJDDZrZzfkkySZ1z+Yp/TFumi6SJfIDFdiuSu0N
	MZHOaOJF50782HqFDWbeMOSWA7EUz1kUYDpIuk2Izis40yxVtn8qP9PgZbKkZkd2UxqKyr
	+8hvlhP8/kffoWgs/mLbzTUm4EFpGFyQtnSWjYrSopVAGrxxKw6Usy/uJ7LbaKIbWwgax2
	39vabeQefxsHdNqL6iYnJpSfOOMW5q8lH1ebch6p0Ak/8+BvW2+38yJHIP/2Rw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Artem Panfilov <panfilov.artyom@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	thomas.petazzoni@bootlin.com
Subject: [PATCH 0/2] rtc: ab-eoz9: fix the undervoltage handling
Date: Fri, 22 Nov 2024 11:10:28 +0100
Message-ID: <20241122101031.68916-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com

The AB EOZ9 can report if there are undervoltage conditions encountered
while the RTC is maintaining the date and time. This is useful when a
device is stored for a long amount of time without being used, to know
how reliable the reported date and time are at reboot.

Patch 1 reworks the user report of undervoltages by checking the lowest
threshold first.

Patch 2 makes so that we don't fail the temperature readout, as when the
system is currently running, the RTC battery should be at a nominal
voltage. Temperature-related undervoltage reports are about what
happened while the system was down, and not about the current state of
the power supply.

Maxime Chevallier (2):
  rtc: ab-eoz9: check the lowest voltage threshold first
  rtc: ab-eoz9: don't fail temperature reads on undervoltage
    notification

 drivers/rtc/rtc-ab-eoz9.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

-- 
2.47.0


