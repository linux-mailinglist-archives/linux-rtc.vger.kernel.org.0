Return-Path: <linux-rtc+bounces-4005-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC181A9ED89
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 12:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D19418927D2
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 10:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C099025FA01;
	Mon, 28 Apr 2025 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KI0GPuEu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B0935948
	for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 10:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834832; cv=none; b=Vm162JFoe/kwIfbn2rEpw3dyVOuo5k/JwvPAMQXxoGPP4AAOESp5i93zts7Y36cFWp9dqF0a99mo1W+wi7mCbVhhrjTcRH9aECdMkh46JjyFnUKB5MerS//4+JxNTTpgAFp7ufZ4ryW/JYIGYjYQuOpDurg2UEA7Ft+WJig5qzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834832; c=relaxed/simple;
	bh=IpQYnj2V7BikdPiduQ7DPxABzU0N39USjUQluxoMkpg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Zl3Bydw/pLhszXIVAbybbg98MryV/ozb11gm4lwIXCvOZnvKSJoBWLBIisDyuWchn/dZ6+vMNPeIHEexVCkAW8uyaddMN7obXPNjKVHAkdJsYB0zX+0DWaAPi+vrk5xBsD5GdeQHsLsbuIJ2Dsyjfw9lAhdItKzzbQsgCsusRLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KI0GPuEu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3454621f8f.2
        for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 03:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745834827; x=1746439627; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzrsi3pi0iIltrZlZhporBCL00VYHTwj++Rse+VApaY=;
        b=KI0GPuEupiiAjNcSdJPzlRcb7RbDkFYhaAObq0+uLeHHeA8xUNezRnGs7HUv5HslML
         NsPWTtjKxf8rbp1QwJjZjdbbYbffi4H+7Q+unTSh3jDEoOe+NRyoMpDhKTdXGBa+bpdO
         FpZEoOjHPzCHnnpiuxuCWmrGLD2h4RGKKBdfwojmdGvUZDF7mAz49P+nWgadqSXj+cE6
         gG5E/SFjJf4nBDi8RAbRUBypdfqb133qGzFqd+qyxNiL8LT6XAxb2BbONKPaaUVVfOJE
         eCTiW24+kD4059UrrS2/4+9trnwUkVO4lF14QhdR12kqP4v9+8lEOrCLUAR4XxeeK4d+
         bf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834827; x=1746439627;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzrsi3pi0iIltrZlZhporBCL00VYHTwj++Rse+VApaY=;
        b=D3eEPS98cP2pBqxt0zV9qfWEqd3rc5DPkVQK03ScuGnAuC9v5hIf/Vp40KJcNMMq3j
         jxG/mwxySpjkx8guSHokwUp46RXbtaoMG16oGEaYW9Y0/Dnm2xHRs5obvF/BEXcPG4Vc
         uNSrzc0dI1tjd5bfFVh/O5EN30thsRotCX1bztumRCIhTp2sb9kEjtn/M40ATMY1icWN
         nndLYOsnXuyserbpy5bSpXXhE01zbcGi+WGfuyj4X6QcvgRjnjoN51cYO0p8hNzMRB1M
         hSN+IlNGCZy+mo3IPe/pTqh6i+zqUY2IGlLeobIt1LoM5H0TxIK/aYrTbaeBLoLZNVyB
         o/+w==
X-Forwarded-Encrypted: i=1; AJvYcCUQPNCNuDCY7s24vlLW95gB8ECACNvg/HwdWwX4QxuRrN2QThutjtqQUPplUMMg108GXd8B7ezKEm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE5ATcIUA6LHzU/tUYypBdGXGV2p19gNEqSD7XDtK+CSZxGLP3
	xwxbjHojWdPHgL4eOTB5ChNmQyCwwsQmo4TvftSKJ/A9PgBcKT4vGhHsAvU5t1k=
X-Gm-Gg: ASbGncvWvA4EZcnxdnSMVzi5VJ0gYHc+7SepRA6r3gDXRmxO8q2wOkfPcZg/ExXmfwH
	wmAOOe7/c64LTPgpWJ+GCvfJQ3ujukXRYHo9lhS6FRlfBAqwJjbxY5hHBUCOpphC/jKy8CKHpcY
	oGenfss6Dms+CLp2ZTUeugsGd0dQVbvW3w18nlpQ+r2Qy3aLF6Xi7hR+HYOprBTb05cvqDxx8e5
	lu59xWaeI5DtAlpDOVgv5VLOkH/uwxNufGYCKI6OXwK2mnbEgBVpTo5z0PHjvnWDdCkNLlR0/f/
	KQh1SfWA/zo9kHTTqstPoIFEmcJ0tLXCytG2QlC09yooOkD+45lL2buvyW4GIC3iORPh9OBqSly
	SrUh4
X-Google-Smtp-Source: AGHT+IHNMdzosfv0+nWOCnzKJE4PE24clv0q95rtqKlyKIkJrHKFkkX3uJfx9+rN3PyvSShNsd3YPA==
X-Received: by 2002:a05:6000:2585:b0:39e:cbca:922f with SMTP id ffacd0b85a97d-3a074e10467mr7569175f8f.12.1745834826873;
        Mon, 28 Apr 2025 03:07:06 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073e5cb16sm10575403f8f.84.2025.04.28.03.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:07:06 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v4 0/5] Fix pre-1970 date handling
Date: Mon, 28 Apr 2025 12:06:46 +0200
Message-Id: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADdTD2gC/3WNzQ6CMBAGX8X0bEl/CXjyPYyHbtlKEyymJY2E8
 O62HI0eZzfzzUYSRo+JXE4biZh98nMooM4nYkcTHkj9UJgIJjTjrKcYDExI42IpCOeU1MaJQZM
 igElIIZpgx6rktuGSRtvW3yui8+8jdLsXHn1a5rge3czr9Wcic8oodkJIcFoDdFcw6+QhYmPnJ
 6lLWf63ZbEdYxI7rpTi/Ze97/sHdmZbYAEBAAA=
X-Change-ID: 20250109-enable-rtc-b2ff435af2d5
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3330; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=IpQYnj2V7BikdPiduQ7DPxABzU0N39USjUQluxoMkpg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoD1NJSthlRJ4uXnVa278oj4zuJgIv+iM7+9LUa0p6
 uTAhsg+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaA9TSQAKCRArRkmdfjHURTgJD/
 0WWjsqWUC4qnee9PLpT2XyUKMGdVSb0smV3awYZrDDWnSMsWWt45UUSXG2Pp7CqtNztkUsLkpGqeOq
 wvWu1nxcTHt/GTvT88AnXO2+p3UcyyRXjdJGrZYuviiV07kC2KbxV8qh5yHEHBLzSrAscr8G/NrzsI
 cXIm79Nqu1lRaKIMC8x2gfkzkWloTXc1NVYYmCUeWEmqQdO44utkF5mGuZWhE3x1bbRx8NLo+Cg5rv
 x+x881vjkXpvSUsVsgA0jEh0KD4Mh2XMmZVBnPDGmFDN+ZzP4VS/K+8ojHBY2kE+yPuDoTus9Sf+0S
 lKDz+psv6iB2b3a8inSkPdelEwq3ADYLdYejGSU1vyoYHjpv3aFHQXXNXZDy5iFqGov3KZZMLJLucY
 fvQyWC6iqRR0pZTFaiqmxXjZEWDvMfzS3n1FQCDnuSmwR7rHiAp64Trv4bt+5kvcSI3+LbnMrGWNCg
 ole74b6YFoz4Cua9mQopWr33fpi7ZhcBfeSBZXFNgUKUzDQt0SerwmbLeLTwrueTSJHrr924YwE5WG
 OKmV/RrVZZ3Xx2N1gCn5ON9TbkVwhfUo8qsjtkrye3i2g7anSQInmn52xwIsycDdO3wOFjY90TNN4C
 v2/RCc4M4S+DgbpfvGjxeIr+0uWEOR9HRdr/ThmOgukSwLOrP87ppHbQQynw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

This series fixes pre-1970 date handling in the RTC subsystem. The changes
are particularly important for MediaTek platforms using the rtc-mt6397
driver, which can only store dates from 1900-01-01 to 2027-12-31.

The handling of pre-1970 dates in time conversion functions is improved, which
is essential for hardware that must reuse earlier dates once their native format
limits are reached. Sign-related comparison issues causing incorrect offset
calculations are fixed, and the test infrastructure is enhanced to validate time
conversions across the entire date range.

These improvements ensure the RTC subsystem functions correctly when hardware
date limits are reached, particularly relevant as the rtc-mt6397 driver will
hit its upper limit in less than three years.

---
Changes in v4:
- Remove "rtc: mt6359: Add mt6357 support" to send it in another serie.
- Change title serie to "Fix pre-1970 date handling " because MT6357
  support is no more related to this.
- Remove "arm64: dts: mediatek: Set RTC start year property" because it
  is not requiered to have MTK RTC working.
- Remove "rtc: mt6397: Remove start time parameters".
- Rework time comparison fix to avoid cast.
- Remove change in rtc_valid_tm.
- Improve rtc_time64_to_tm change for readability and efficiency.
- Extend conversion test cover to reach 1900 year value.
- Link to v3: https://lore.kernel.org/r/20250109-enable-rtc-v3-0-f003e8144419@baylibre.com

Changes in v3:
- Rebase on top of rtc-6.15
- Added explicit start-year property in DTSIs for MT6357, MT6358, and
  MT6359 PMIC RTCs to ensure consistent values between hardware
  registers and the RTC framework.
- Removed hardcoded offset and start_secs parameter in mt6397 driver
  in favor of using the DTS start-year property.
- Fixed type comparison issues between signed time64_t and unsigned
  range values to correctly handle dates before 1970.
- Added proper handling of negative time values (pre-1970 dates) in
  time conversion functions.
- Modified rtc_time64_to_tm() to correctly handle negative timestamp
  values.
- Removed the tm_year < 70 restriction in rtc_valid_tm() to allow
  pre-1970 dates to be validated correctly .
- Link to v2: https://lore.kernel.org/all/20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com/

Changes in v2:
- Split the patch to have:
  - Add MT6357 support
  - Fix hwclock issue
- Handle the year offset in another way, but the V1 way still viable.
- Link to v1: https://lore.kernel.org/r/20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com

---
Alexandre Mergnat (2):
      rtc: Make rtc_time64_to_tm() support dates before 1970
      rtc: Fix offset calculation for .start_secs < 0

Uwe Kleine-König (3):
      rtc: test: Emit the seconds-since-1970 value instead of days-since-1970
      rtc: test: Also test time and wday outcome of rtc_time64_to_tm()
      rtc: test: Test date conversion for dates starting in 1900

 drivers/rtc/class.c    |  2 +-
 drivers/rtc/lib.c      | 24 +++++++++++++++++++-----
 drivers/rtc/lib_test.c | 27 ++++++++++++++++-----------
 3 files changed, 36 insertions(+), 17 deletions(-)
---
base-commit: 424dfcd441f035769890e6d1faec2081458627b9
change-id: 20250109-enable-rtc-b2ff435af2d5

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


