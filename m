Return-Path: <linux-rtc+bounces-3719-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 744C4A78CA6
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Apr 2025 12:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 925CC3B1542
	for <lists+linux-rtc@lfdr.de>; Wed,  2 Apr 2025 10:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F584236A72;
	Wed,  2 Apr 2025 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BbVA3Q1v"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FAC2356DD
	for <linux-rtc@vger.kernel.org>; Wed,  2 Apr 2025 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591083; cv=none; b=jP1BOdFg7w1MGeC+QAvt4z5fc4Ka8SJoRX+HQ+t7RPxqdSH+O0QxzKqFl+gaaWL941dswSWKkhpeFc9V4u9Y+TXSUFkQS35ZQHkhG6chNxilFyrFaJpzTBpsEoI7G0QbxrLg3yUZZ+h8AQfQQ4kFulIYjSdI3khJG0W9zkNpYe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591083; c=relaxed/simple;
	bh=3X7KZmMhwl0HYqgJFICiGwUGVJ3nQ9dIw3MwJDlXC/M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bpNW/bTjlDWzoPJOwaro3WWqQ3QJTMabUtiwQbSl881wHFse0oC5pMjIVxVOJToUnzbBRRZBGJF0m+gSJ6Vlct7Iyj7Mt05F2Oy0bzVA+gFR3hDF4fRAWrafjNX5tTZA8V5oXcThCnLoFudWRerSUediBLNmTt9hEtWqnc0ONY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BbVA3Q1v; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c14016868so3004509f8f.1
        for <linux-rtc@vger.kernel.org>; Wed, 02 Apr 2025 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743591078; x=1744195878; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=677sZq+YzwT8s/SpNUo/0Bnrhf0tAcbKEaGsUFnux/g=;
        b=BbVA3Q1vXB5mqxjKuw3PSgBM44+3GOSVyfD3FVm3vqCzfUQWsOJ5dsXSCZP1Zpu4rQ
         iTY9PDcAmMCUcgEFWD3kj7YEKqN7T+4exWg+vFjFvnJRuS55TcOQm+1mJbo8SisHtqmb
         6q5pHeTbSMGldfVrLO/ght67SJTXf1kBCqGaJbgU+cfATPBWH844MTq18oI9ySn3h22e
         h65WsVXYxmHW2c1PcICfnc6dYZLhYaiXBs0yjYch9LG86kJw0a/Qtoxpmoy4WvZuSMbB
         LmdyT5vixbXTJHdaL3m2JEJhGYKVluOOmidK6lBnqCEmS1a8ReU3CSPRj8+iIyj0fbqC
         i7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591078; x=1744195878;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=677sZq+YzwT8s/SpNUo/0Bnrhf0tAcbKEaGsUFnux/g=;
        b=wX9Un6gHySpAaHB+AP2lTgz69LzU1ZEL/GI26LVxaLzmfU+ev6xYqPUoy/dk/TtDW6
         dgGrh6LddfpH0S3YSxjmxUvt3Lq0T+aufXsEoefHBo719rWuTRNJ5MAOxhjbrc5ml/9C
         0OTmRBZCfKf/6qilJgL6W8it5/SlKHBz5RVDnoZh214PAfZtEkMaiF/TO2J1VDncpfVg
         0c0uH2uxTY2V5WjJE21KBnP09of7QhDRw4It2Teq+C37MX/S2ND7vraR0izNAZrH2Tex
         hEu4ADvTuEr109WcwSZzEFAv+zW09btkXMcaIs29Wv/6SprD+59uFKlUjGH1AApu1Oxc
         TQgA==
X-Forwarded-Encrypted: i=1; AJvYcCVIkYwx/tHKV4T3TzjJiSsCo6B3+sWL9tbAuFJInqrGA1n+arFfF9FAkMZh9XLFPcSVDWt0HAg1kYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4GWEzHgP9ufxnDTzkDts2bmV3A9Iw8xT39saG4wjNS6q80atx
	wCRAjDBg3MidgRLn+w+6T2Bu6mM8HtHiCdO5ZbBE+zRTYC7Do9/0dN8KnDb6Lmo=
X-Gm-Gg: ASbGncudgANrQM91j1wGvdsUqAacADmyYkNWpRzR5F1mRcDmGM6dpZln0y+RRq7VUl5
	5iGRrxf1LGZCpezX4fnmr4ENBVAPXMbwr6WsoZaWfSY9D4Dz41uClHW5IEpgpl9IUNN/bW/EZc9
	MZ3jIyhXz/XpG8/vqZPUY2Jbsyuh/cMwkMPKYv4whgOrZqdyQE2BdYv8TVbu2ADw59A+RdVmfQU
	iykcjgJxcluDo1ycY6l7WG/PJwex8ljkOFGMOn6apV5Sr3znklBh9h52SnFllGONNaNXyv69aOm
	hH2Z1CkOanimBSkFYPSm+gVdtsRTKWKa+aeEH8pXWYkrB86J
X-Google-Smtp-Source: AGHT+IGOlgNM+I1PktLz32eEZ57ov0e6FZNAEgQYjGQgjAQrXNcZq0X+7ErG6RVw6HyRscnCkvIR6Q==
X-Received: by 2002:a05:6000:184e:b0:39c:12ce:6a0 with SMTP id ffacd0b85a97d-39c12ce0a88mr13388501f8f.21.1743591077978;
        Wed, 02 Apr 2025 03:51:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:b96e:56b4:f317:73c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm16849484f8f.94.2025.04.02.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:51:17 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v2 0/2] Enable RTC for the MT6357
Date: Wed, 02 Apr 2025 12:50:58 +0200
Message-Id: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJIW7WcC/22NQQqDMBBFryJZdySJjdiueo/iIhMnNWBjmUioi
 HdvdN3l+5/H20QiDpTEvdoEUw4pzLGAvlTCjTa+CMJQWGipjVTyBhQtTgS8OEDt/bUx1uvBiCK
 gTQTINrrxUHJbqwbYtcf3YfLhe4aefeExpGXm9exmdax/E1mBBOq0btAbg9g90K5TQKbazW/R7
 /v+A5F3sHvDAAAA
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=3X7KZmMhwl0HYqgJFICiGwUGVJ3nQ9dIw3MwJDlXC/M=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn7RakYtp0bKzyxV1J5GL9+6QybnWsdh66v7+9FXi9
 1PPTL+aJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ+0WpAAKCRArRkmdfjHURd+REA
 C2QEnGgy8gpfrAzo2s533rgbgWhRdULalx9DKETDrArGImRiZxcFC6osFt8LdSuXKwXLZfCDHG4e2Y
 6M6JUV6tEbtN0DLRCSit79skUJQIkzaGy1nJ5mTfOUGsp258FrHY3R3ibu418gpvTG/b/eIfCFCGsm
 GiK7OHe968BUyrTszBFYlcB2MMzPAdkdBA7aLVSrSRokmHEgkkSQ/WZWncGRxh89tQl+kS53SMILP1
 EW0Pz43njuoxedzUzJvo4z8P5rgwprm6B7J+j0WWyOaN22x3hwYhlrIukrUznx+WNbG7zMfL9Wx4eU
 5kE9vjk2HRTrp03cHG1Zdr0G0VTqEAf6jUKFJDleuD4bKqlWEhdmpF0D/0czWCIhdutujsZt5Qx/ib
 wEZC0cKa8mK5hb/u7k3rxvpBzAMlEsK6pHxrVRCJxHKDtkrApFWZj8mcWnYTRubSO9PKZa7tthj7wN
 iBz7vNrKEFyY0yB4TxSZ99vwF52AL8F1m4Q4YBeft/Zs9PC4Eedaq991NlOLd+ULv7XSDeeLVP9bhl
 wj22KJcGlGy7eVDFjL8B/2aM0RHZx8mq0WpCn3A2yrJpB8oPlSPpm+y6M2u19tzxTkTRACXVTZ3RF4
 eAp5BQn5HyGv7PKTJHzLDM+b+ukvh01zEuUIKc9f2lSPX+Goa+/Io4kaKuog==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

MT6357 PMIC's RTC use can use the MT6397 drivers with the MT6358 data.
Also, since kernel 6.6, a regression has been observed on the hwclock
command. More detail on the commit messages.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v2:
- Split the patch to have:
  - Add MT6357 support
  - Fix hwclock issue
- Handle the year offset in another way, but the V1 way still viable.
- Link to v1: https://lore.kernel.org/r/20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com

---
Alexandre Mergnat (2):
      rtc: mt6359: add mt6357 support
      rtc: mt6397: Fix mt6357 RTC year offset handling for hwclock commands

 drivers/rtc/rtc-mt6397.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)
---
base-commit: 97274527e8dc709bbb4c7cb44279a12d085da9ef
change-id: 20250109-enable-rtc-b2ff435af2d5

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


