Return-Path: <linux-rtc+bounces-4243-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26225AD2EC9
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Jun 2025 09:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0E943A9DF2
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Jun 2025 07:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD4A27FB0D;
	Tue, 10 Jun 2025 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UHFOtx/Z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200A825C807
	for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540929; cv=none; b=CDuepfhlvBpyNmJyPRoqPySLNIjlJYRBC4wWQ5BVPvO4PZmYADwWqHb7F3I+yDKDs/cgt2t6b7co3ksuhPYU9dzPEMKOKvd6AwwLsVfITOoGbxZsz5T0I9gjA0VE/yKZoEsY2W9TVwGnp+IPhB/uNXZschHHKGzuAhBVSVFUWvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540929; c=relaxed/simple;
	bh=71kPFbeIHYmPXRrsapFjJ64rErsVjsccg2t4mfNpiEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xga/tpbNDgcZl11Zc6nlZzA1jp3UP1fBrKOftuu9yn64K5/mis0CzJV43Hg7v+Cuf4VjQRzrrcv5TfpbIPBC1+NJAZk1n+Dk6jhFw8wz5fgALb76xEDqwqljfQXoj3C67BtV+WqR1tzLTrCNorQBeEBCHyAu5Tnnhrwgz5wZ7XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UHFOtx/Z; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a5257748e1so3410695f8f.2
        for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 00:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749540923; x=1750145723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J8h3pByd7nHfj/LOV5MKawLqfW6jLcpqpN4uASplC/o=;
        b=UHFOtx/Zq2ijB4N9CyS/RSsKXse9SG6I5ILS8/zIG0MDDQWZgThEWge5lGhwmlMXUS
         zw7dqdvn7clTkJV5MsEqDfpRL3L+FnhahuqWUP8Hs48QG2qWB3BQfPLIPhvfGGEQtfNV
         HzuCq17yUvjmmQbYtDJ3AfTcKuevFynySCs7y3+Wlg91TtNwmdXF7fKXizANexd1SPjp
         5/c9e8WBYyE3RPxg/ZYUiPalJ1PnSCkvG1Q4LE6HF02VvLkfCOTTE7gcLKBr+rBykPhG
         G8eFbv+78cab0TRw08uFl/Q4A9bUUVkBKzoGsZcBex0UNXKskmarPyblQl3rOe2C5Rom
         VyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749540923; x=1750145723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8h3pByd7nHfj/LOV5MKawLqfW6jLcpqpN4uASplC/o=;
        b=HrB03F+jQRcs6Z+ng1hKrmHUazExmBF7+Vrs5G9AcsoKOzbDpOYMb6BGulrWRjv9+i
         bzI/Mp35EM/6rDiTNVLuDN6dxZdi3wF8ig3NvlgcboNkrp4OIU6N+bMCnH19oDgxTOoX
         RpYrz1805VKbchKUnzk37dpIYEeo54Ai8gh0M+/d7MUKCX3gwJLMWAOEH2AQK6rStcqI
         EEw+Hk609viwnvU1qJ29oTv/YY0hSxW1vD/sGSuXMbRgEcYhtKsSSMfEFHfA+Dvcy2qo
         K5r1VrrQPylnORBl9EmWSg6TKD66FGhLIx4m7BB9LI8cltCq76NyodyFMjiGt8RwxCbL
         ho5g==
X-Forwarded-Encrypted: i=1; AJvYcCVkaaoipm74i6g8KrK7EV8NYCwmu63DIXHMlQUq9KPwT7ntVv+AgcgJHo7ZRtwkFTRzc0IJeemcvnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyal+MT1a3ICzTXFSY0KprtrXUpAAr0oxH+4r7rTk/NPkMm/2/W
	+8cuMAvqUDbAC8UNSPCpceCq9jaFAfiiZQHXDAVt6Cj8+H35S77P5imIF8/00U961JS4MMTpEer
	PewOM
X-Gm-Gg: ASbGncsIqQZ837EWqcLDAJB4WB4u+/WmW6bihZPcDd+7kFB7lkkCJ6PV/Lq3Fg8cb0g
	ux48KyvNa9OjePp0Cvi9U4SQQAWp3+6brWp7Y5uKm5bgfmSKsSGpPJ1+K+g3uxMSSrzv2A5mOzT
	fmOUe8gj1h2KoCWeH13BPm0Gv8BB9V2bceiZjQkHQr9lkx+RHM5Y65HSIcpjc+Nn/A6Dix9akv1
	qdfjpm6/IjhwLmG35KwF6NBcaOb65rIUKNGTj2CNzlhBQReq+90Uo5d1u8d7MWCV2FHTtcrwNfc
	gHfrdfmPoSfpKvq2lbqxV66gYJUvfTjAgsDh/dmHaKNsZqaZFnTnb81e9Gnp1K82ghbZH2p4h7D
	qWWqxl46Q0ovgvv+/drdWcG6hZSs3dpt5syWkaIE=
X-Google-Smtp-Source: AGHT+IHsjxzUdELx18rezFNzmxJKTNRB40yRUhdYPbz4AWECwksdtBmek2zjwBXvFRk/XTsDTzbT5w==
X-Received: by 2002:a5d:4dcd:0:b0:3a4:fefb:c8d3 with SMTP id ffacd0b85a97d-3a5319a7a59mr10793288f8f.40.1749540923424;
        Tue, 10 Jun 2025 00:35:23 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a53229de0csm11340604f8f.1.2025.06.10.00.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 00:35:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
	Cassio Neri <cassio.neri@gmail.com>,
	stable@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 5.10.y 0/3] rtc: backport support for handling dates before 1970
Date: Tue, 10 Jun 2025 09:34:57 +0200
Message-ID: <cover.1749539184.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=71kPFbeIHYmPXRrsapFjJ64rErsVjsccg2t4mfNpiEM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoR+AimG2JUFGxzNyMnxXuTqUnbHEaEpsW4FXrB 2PwIf+nkaqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaEfgIgAKCRCPgPtYfRL+ TgjDB/91AsfWdd/8uhhcXzbfmNtuQ6RvC731jWw73QR5/rwcdreCaKfHog6g1KSTSp9WhuSe5S1 Mv9F/RW23lj7vyPKz5JIkPjCU3EAI0MNyCLu5Y4SfvTzEF0vMpTat8bAlHZaTfQ6ulCpgR6HKfq n4LxGhMQYI7OCUt2UOpPofHDAdMdTL2DeyjmMJDw7XKyNoKO05dFFzGC68PlGqe8bLYYTmGTtdF U38unQADW5/7+wha7eEhQTRnsyYBg1iOIl7EcZzj4JAx9oOGiqSkhmULtcoO8llRtzxNk9RG8bd kiQL9oNKV6gIAEKNvXOmriWpw872xna05QDPkDQ4W6qhQAOz
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this is a followup to
https://lore.kernel.org/stable/cover.1749223334.git.u.kleine-koenig@baylibre.com
that handled backporting the two patches by Alexandre to the active
stable kernels between 6.15 and 5.15. Here comes a backport to 5.10.y, git
am handles application to 5.4.y just fine.

Compared to the backport for later kernels I included a major rework of
rtc_time64_to_tm() by Cassio Neri. (FTR: I checked, that commit by
Cassio Neri isn't the reason we need to fix rtc_time64_to_tm(), the
actual problem is older.)

Now that I completed the backport and did some final checks on it I
noticed that the problem fixed here is (TTBOMK) a theoretic one because
only drivers with .start_secs < 0 are known to have issues and in 5.10
and before there is no such driver. I'm uncertain if this should result
in not backporting the changes. I would tend to pick them anyhow, but
I won't argue on a veto.

Best regards
Uwe

Alexandre Mergnat (2):
  rtc: Make rtc_time64_to_tm() support dates before 1970
  rtc: Fix offset calculation for .start_secs < 0

Cassio Neri (1):
  rtc: Improve performance of rtc_time64_to_tm(). Add tests.

 drivers/rtc/Kconfig    |  10 ++++
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/class.c    |   2 +-
 drivers/rtc/lib.c      | 121 ++++++++++++++++++++++++++++++++---------
 drivers/rtc/lib_test.c |  79 +++++++++++++++++++++++++++
 5 files changed, 185 insertions(+), 28 deletions(-)
 create mode 100644 drivers/rtc/lib_test.c


base-commit: 01e7e36b8606e5d4fddf795938010f7bfa3aa277
-- 
2.49.0


