Return-Path: <linux-rtc+bounces-3322-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E633A49B46
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 15:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D2E91748B6
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Feb 2025 14:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7177C26E160;
	Fri, 28 Feb 2025 14:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Krie4Osc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA9025F984
	for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751645; cv=none; b=DB0J1z0TBFNxZM4RsWqFqRrEPPyDnsb++kxygS7I7W5g51WSwpfp3QMUfnbLKvoCF8C6mZGIKSC4+oEyPwAe/14Z4tr+E6HuCc2CtEP6SSE+GzBzrpOtAHkKXf1Ny1CHa2/2ccNiC4ZWXgrsVprtXZycEufz2M2l8VfBauUfsAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751645; c=relaxed/simple;
	bh=D6dkdQq4iA5tj9KDLaYBN/k9ZLQ40l8wYqCnUHgdGG0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KF3jU3u/5SF6mJVa6LEYtTQQWy7mcoUq/mmjezawu+z4J/pvhydtUYxv/uNfKhJX/jrGkq11wE+A1agQhJqFmpZBZ1lNKwVzBTNtb6LJAVdIvBx5O6FLiXhBz601mt6K3t2twxleXPurJ/FoQOsXUEybIq1JutpF9UdlKVEUV4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Krie4Osc; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dec817f453so3274418a12.2
        for <linux-rtc@vger.kernel.org>; Fri, 28 Feb 2025 06:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751642; x=1741356442; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhLZqgcaujiFhw9G1dCH5p0FiLmGyvslkaMt4uwl9Do=;
        b=Krie4Osc0DNEinlUAyFTqNzopM5rxbSDXSx+7/YIPnjHeGkHfJbBSUjo5mkF1GKs4q
         mIrLqoS2F1GPTgXE54L9i6ipSA6qu45Gv9Gj/Jd5dt9ragEQW6UOGl4Cxge2DF6kbgnO
         GEd/s4zk+TUhPxnvMcjBFvEuok4LJx77ZKCXFieXx3nkrw1uiu3AnSEIUmzN37Sd4E2K
         3L9qQIZY4xgnsISUYWuiKGDEyBTxjJEvgyRlJ+0CpB99LzLqq4iCOaMyUjaqL+OyjQE/
         IFHVKBpQaQce3fOlqgVaoZI4DddaF1r6ZwiFzNyrWLy4L+0ZYllhH3UXHyok3o4tJpNF
         TQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751642; x=1741356442;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhLZqgcaujiFhw9G1dCH5p0FiLmGyvslkaMt4uwl9Do=;
        b=F4BSAPrL4qR5PM7q2TMvzUUGzXWwBa8L6ijryDM7Ts4N8K5CCbgVbVQDRXflGf7kfy
         4UuVJHpFZxkIvFggc2ULUTjzTxUTChdk5yChri+8FvUAvis3lE6uEQSbBTaeAYo3WOUQ
         UHxC3KghTJDGqRJlmB2TJIRu86DUyjufFGzWoi0jxkDVW9kZxDsWt0ir+viCmL8XAUPY
         SNQ06bysqoXgA7xihTXE/OVyu5aF71z/735qnRwd6X7K9uHSOclyF2+9Aq9lL7rMXpf1
         BboAqOHcJAJyWgb1sVFmavxrZoRaf22QxEPxOVdIPMLzVXL88cAJvvvPiG/+HjD5tTdh
         6Jxw==
X-Forwarded-Encrypted: i=1; AJvYcCW9CTu2R5AKPSU3pDGFKsHRUM5B7IUoha/dcvfhKcaWN20OycgXmOE5Atr6gG/4iZeLXhx0hXU4xYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZRlmUVI5ZSXtXKzbf/U8DYxz/qLJh4VrUvKftxbVm5lObOb4w
	9HXmHgsO8cAvFREjpKhmXMA1wI7Mp2Cc/6c63PHfoqm/IljjOuV5YQDQpJEA0vvPdik/iYu+68E
	Zj4o=
X-Gm-Gg: ASbGncv8tFJcxGieoIMDaH8iPsy4PSiv/sNU35kK0qRBsGeQX2Zuq8pYtyp44umKlR/
	B+dTQYu5v7BEYFTKfiODspzhxo+RXQUq5H6g/7opjzz3azOxdajubiQ4WpDFK7+ZsjO291FdYok
	Of9pHcBPPoGgJQnZWQ/Ezj1Xv/M75slVJTfJ7mvo/vyIHmh01qhugMZ2BVfc/4Mq+Fk7m1c4WIz
	FTcgjCyIQZcD52VHcZNtw33Q7lZT59f5ffPUErgDkP8J5P1cDF42WSnI7Njf0dZELgkvq51jpUK
	tDZwz79NItKhZmX4tybPy72wtZIObKPfEd++1+DHomtEZ6jC1IsTYslSTg7xMER/pGfMDYUDyAc
	Nazp9hbdwcQ==
X-Google-Smtp-Source: AGHT+IHP7pUAJMVQB1Guj47dyI47K7YXQj82SFh5z5QQxgHATc6r4NQ1/TjLpJM/Ncf+/B2eBWDZ7w==
X-Received: by 2002:a05:6402:5242:b0:5e4:cfb0:f667 with SMTP id 4fb4d7f45d1cf-5e4d6b691d6mr2481074a12.21.1740751641613;
        Fri, 28 Feb 2025 06:07:21 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:21 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 00/18] a few rtc driver cleanups
Date: Fri, 28 Feb 2025 14:07:13 +0000
Message-Id: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABHDwWcC/x3MQQqAIBBA0avIrBN0SoiuEi3MphoIE60IxLsnL
 d/i/wyJIlOCQWSI9HDi01foRoDbrd9I8lINqNAoxF7Gy0l3kPV3SFKjU7PR2JLtoCYh0srvvxu
 nUj6cRcJTXgAAAA==
X-Change-ID: 20250228-rtc-cleanups-12c0b5123ea4
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Hi,

While looking at RTC, I noticed that various drivers are keeping
pointers to data that they're not using themselves throughout their
lifetime.

So I took the liberty to drop these pointers and this series is the
result.

The last two patches also convert two drivers to using dev_err_probe(),
as I looked slightly closer into those two. They don't exactly fit the
general subject of removal of unneeded pointers, but I wanted to share
them anyway, since they're ready.

All of this was compile-tested only.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (18):
      rtc: max77686: drop needless struct max77686_rtc_info::rtc member
      rtc: s5m: drop needless struct s5m_rtc_info::i2c member
      rtc: aspeed: drop needless struct aspeed_rtc::rtc_dev member
      rtc: ds2404: drop needless struct ds2404::rtc member
      rtc: ep93xx: drop needless struct ep93xx_rtc::rtc member
      rtc: ftrtc010: drop needless struct ftrtc010_rtc::rtc_dev member
      rtc: m48t86: drop needless struct m48t86_rtc_info::rtc member
      rtc: meson: drop needless struct meson_rtc::rtc member
      rtc: meson-vrtc: drop needless struct meson_vrtc_data::rtc member
      rtc: pl030: drop needless struct pl030_rtc::rtc member
      rtc: rx8581: drop needless struct rx8581::rtc member
      rtc: s35390a: drop needless struct s35390a::rtc member
      rtc: sd2405al: drop needless struct sd2405al::rtc member
      rtc: sd3078: drop needless struct sd3078::rtc member
      rtc: rx8581: drop needless struct rx8581
      rtc: sd3078: drop needless struct sd3078
      rtc: max77686: use dev_err_probe() where appropriate
      rtc: s5m: convert to dev_err_probe() where appropriate

 drivers/rtc/rtc-aspeed.c     | 16 ++++-----
 drivers/rtc/rtc-ds2404.c     | 14 ++++----
 drivers/rtc/rtc-ep93xx.c     | 16 ++++-----
 drivers/rtc/rtc-ftrtc010.c   | 17 +++++----
 drivers/rtc/rtc-m48t86.c     | 14 ++++----
 drivers/rtc/rtc-max77686.c   | 37 +++++++++----------
 drivers/rtc/rtc-meson-vrtc.c | 12 +++----
 drivers/rtc/rtc-meson.c      | 16 ++++-----
 drivers/rtc/rtc-pl030.c      | 14 ++++----
 drivers/rtc/rtc-rx8581.c     | 85 +++++++++++++++++++-------------------------
 drivers/rtc/rtc-s35390a.c    | 22 ++++++------
 drivers/rtc/rtc-s5m.c        | 58 +++++++++++++-----------------
 drivers/rtc/rtc-sd2405al.c   | 16 ++++-----
 drivers/rtc/rtc-sd3078.c     | 71 +++++++++++++++---------------------
 14 files changed, 183 insertions(+), 225 deletions(-)
---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250228-rtc-cleanups-12c0b5123ea4

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


