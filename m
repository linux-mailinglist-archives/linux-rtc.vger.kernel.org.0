Return-Path: <linux-rtc+bounces-4235-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11686AD0616
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Jun 2025 17:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B64217BD94
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Jun 2025 15:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C8228B414;
	Fri,  6 Jun 2025 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YtzRb7v5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A752289E1C
	for <linux-rtc@vger.kernel.org>; Fri,  6 Jun 2025 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224712; cv=none; b=AfapPmSZHX4Am+1fSP5KZA/xtRwfDvEC0NJ+Qxha2Rc6h+TzY2fm8nH5kKgG/SHzHilxzvIVIg7CihjHBOqObNVWzSnMTN7mZepc59OcuwV8chiYljLiewwWsylmZdECoouz3/WspZvM9D5KYtHlFCj1c4K92xgtzWDB4AKDTVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224712; c=relaxed/simple;
	bh=6Npv+iVB4mGRCGs71gegYw1wuikB/KQbuB/fwnSYyVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pV09Y8AwIc1mMvOEQeQScXcox3orcuROVbygU/hGX2F9qaIwDOxp9edj4wMA5xMqFnl3fFfKx3Xd/oDuaIKrd9gA8V8ZYujnw6552LQcfEvwtidt6DNHv3vO9Ni0xgVtF+usWq97q7vlquIH/tbJMEBkFkxTKoZDL3bCkqTEWOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YtzRb7v5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a36748920cso2174981f8f.2
        for <linux-rtc@vger.kernel.org>; Fri, 06 Jun 2025 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749224706; x=1749829506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/eRrKWisAlqCaTq6ESMFuJF+EV06jSu5T0YzNA5KckA=;
        b=YtzRb7v5UwSrujsV4XgJkblyWhX6ARC54W+d+3ufml/MulmA2Bg6POzpsL8RCFHuFF
         sqewyKkg7vfl3Bz677x939Iv/AjLj1Pfeczj4fZWDOQlbSSiDq1oFWOuv1Las7791T0s
         qBYa8MwYG+Hz/BTGHiWqDwg76YE2JEidXxU2jUKtcvTZ6qASqHN1P01aGKshncs++0o/
         bSKTG+hwpuOokxM0i+ywIKb0WKAbKFVnX9utWtORqfU13n1GeoF6UW+StVoG4F5MKbUM
         VSqONx8+ORyUcbrzTvxWdUwMHJZ4/IlMpHudT1yR5w+67LsDIsDq/K9MdTDHF2TcmxLw
         BReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749224706; x=1749829506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eRrKWisAlqCaTq6ESMFuJF+EV06jSu5T0YzNA5KckA=;
        b=Qsf/gPobkumUTk1HgaXa8RKhw73Xe7Mmp4Pjc/8+2CXBvfNxN8pD2gOfgc8+gvhJoz
         HgVxe6emoU+190kRxq53pL5K37SvXkKB7+55+ibUnsWVKXzWjE3V2aD8WhERO+NiM7bw
         3ABjG+kGvykM5IjBn3ASTGoS2zg//vX+eh0PvTimL2gz6/gCNsFUzNuU+1+pCYZwyLEC
         Tvd7CHRo3g+6vY2ohxcsCj1ZkAudeFKQk/uWnrbuCyjvNYKDB4v1pZgI+u6jjR81v0jC
         ZOJMfWLauitRu6P9S2EEQ2W1HbBh6ge49ORmvOgU22OWBYSFeVP1uexAwRCzA4jbyT2f
         P4Nw==
X-Gm-Message-State: AOJu0YxGyCJSK262rTrtJt9gmhozxfJSn2MhQMY7hHZx/TvZLTXNmsZ1
	EoXtQjsgtYJZ+ysZDZquhR509tEug7XATcn5BiG3D5qP3G3pFs/hh+ilp99Oz56Amac=
X-Gm-Gg: ASbGnctniVJMuZe9ef6n4TMLoNfc/APeRAiHNBgK+9fG+vsoEhbExLstIQeCfIiCaIc
	hhCEzOK1w+fiw5VGhXrP+i2fU0oT5zwno0uUjuM+5wMAaocZ2YGGpTKg/47cQfKWJPC/MAgjvEE
	2rxbcP/1vA2+3tcpz0tIxei3Etb0q5ml69MfKtz1aBFnZW40yQKjskCuws/gR15u4XbW65rDCIq
	1X/aV1e0eESZEoCjiHaE3WqK9KZfl9T5BKapcdg3rfZCyUG9+9Dl1uPyxqPNPFEGUkC5PQaSg1W
	zVHGOiNhS5peGD0YJfhGG/qnrq4RN7LFVwRNNW2vsEQSaNn1AqqERO5Uyl2Pa/cUNp+wJvyUV0o
	W7TfyoX54N46m4+sE65AagQ4a0CAy
X-Google-Smtp-Source: AGHT+IHSobbn18Gj4/PsZFFRBQ+vaWtAP7bPkbsPEi8TLhuY9M5KhYA9iiVjF125RMM9+sP6S1EyOQ==
X-Received: by 2002:a05:6000:2dc5:b0:3a4:de02:208 with SMTP id ffacd0b85a97d-3a53189ea71mr3332123f8f.25.1749224706539;
        Fri, 06 Jun 2025 08:45:06 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a532452d7esm2204941f8f.85.2025.06.06.08.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:45:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-rtc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 6.15.y 0/2] rtc: backport support for handling dates before 1970
Date: Fri,  6 Jun 2025 17:44:37 +0200
Message-ID: <cover.1749223334.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6Npv+iVB4mGRCGs71gegYw1wuikB/KQbuB/fwnSYyVA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoQwzmwmVp5HefOvYACnlYS9dtXgQ/Vnf2oPuHP xftNg+zIJKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaEMM5gAKCRCPgPtYfRL+ Tmd3B/465tvD1rHAca3OOMo/hcI0O8bPhbq7yj/mzxO4GZABJQjrKrrfinj28SSfD/yQ7VTtdqf JqOIJUV2ToVRf6GAfwD8UIIt6bq69ypm0Ke69ZSfvLwNbPaCA5O3zD1ksh5UotsRDmGcf4Fgyi8 2xufPjSJbO4DXQJraUTKCYH3QbY3kB9eZ/XXgjxpizwhQPdkicov1Sh/wKVhRnHjZENutsJzPRd 18o3hpl3MS28zCz1nxZsBG4dDsCSj8iqa+ZlcNu59FjUK2OQS5XXn2CIubQzCinrlM3RbVxvwy5 BehgMswtl9+FbR7+9hn4N3rY9BUGXhad1nbwuDtam4Uku4Vo
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

as described in the commit log of the two commits the rtc-mt6397 driver
relies on these fixes as soon as it should store dates later than
2027-12-31. On one of the patches has a Fixes line, so this submission
is done to ensure that both patches are backported.

The patches sent in reply to this mail are (trivial) backports to
v6.15.1, they should get backported to the older stable kernels, too, to
(somewhat) ensure that in 2028 no surprises happen. `git am` is able to
apply the patches as is to 6.14.y, 6.12.y, 6.6.y, 6.1.y and 5.15.y.

5.10 and 5.4 need an adaption, I didn't look into that yet but can
follow up with backports for these.

The two fixes were accompanied by 3 test updates:

	46351921cbe1 ("rtc: test: Emit the seconds-since-1970 value instead of days-since-1970")
	da62b49830f8 ("rtc: test: Also test time and wday outcome of rtc_time64_to_tm()")
	ccb2dba3c19f ("rtc: test: Test date conversion for dates starting in 1900")

that cover one of the patches. Would you consider it sensible to
backport these, too?

Best regards
Uwe


Alexandre Mergnat (2):
  rtc: Make rtc_time64_to_tm() support dates before 1970
  rtc: Fix offset calculation for .start_secs < 0

 drivers/rtc/class.c |  2 +-
 drivers/rtc/lib.c   | 24 +++++++++++++++++++-----
 2 files changed, 20 insertions(+), 6 deletions(-)


base-commit: 3ef49626da6dd67013fc2cf0a4e4c9e158bb59f7
-- 
2.47.2


