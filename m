Return-Path: <linux-rtc+bounces-52-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D397BC777
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Oct 2023 14:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 336BE2813D1
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Oct 2023 12:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44064163;
	Sat,  7 Oct 2023 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MKOg0v1l"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A91427719
	for <linux-rtc@vger.kernel.org>; Sat,  7 Oct 2023 12:30:53 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FD8B6
	for <linux-rtc@vger.kernel.org>; Sat,  7 Oct 2023 05:30:51 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50585357903so3978674e87.2
        for <linux-rtc@vger.kernel.org>; Sat, 07 Oct 2023 05:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696681850; x=1697286650; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sIeLNgJsbwk3FNCig8ASjFZb8D9p0dka+VC6lW5wH7U=;
        b=MKOg0v1lrVITOk5cdY8HMqSPN7PeYe9jK2c607+poGL9iyUu7OC59geok6e9vVVuju
         ys0oQXiBcs8Rz/Vh3BBU93OVxtxhEiE6WoGO8mx+iAdm9sYCAlDxc5yZKGukxxdp2mB8
         BiObA6pH0TdzI/XdruUcZllJwU/9aZiaowz6QBiTO/tksgK/iwMlEpPlImlUlf7iwe1j
         vadENTD6iyx0FEy9a2uRU8QWIjPcQpOWdNEls6AhkHepzcQG7UuvphEtJP3K/5UKQ9rm
         Kj/BqYRmB81FgBVEbb501QVd3PGnzLdBXk1EVXtsHvhIrZm9cSLC6vO4rPc6jzFVV6t9
         30CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696681850; x=1697286650;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIeLNgJsbwk3FNCig8ASjFZb8D9p0dka+VC6lW5wH7U=;
        b=h2lzJBRbEb985IQeMSsoBq04eMhMa4/OvX+vZzShnoY9aCTIOLV2JIzyNmxqHfFawu
         Xm2pIqPBObTTkcfy9zYw4cmpGWSsSwQ5zvQYzqbfosVQSXlljW1bZ2t9v3vDcIvII8bz
         0mNbvJd5vRX66gT/lxIVNGq1Mn5K99kETWAbFIuNBsUqSzkKmVwcuAZRTbvFdMU7E7y8
         HR2Tevcbz11j/mMF2ezSBoWrzaKUXFOaHgRwHgAwsXTZfSRZZVWcsSVe3suxNit5P6Ud
         DKFOqLTq8arFWDP1KhYZ3tIckg/3BAUrOxPEVEGhneaYGAbGpwMOhWb+2ST7Z9R8jLnx
         NBog==
X-Gm-Message-State: AOJu0Yxuw5iA3Ru3sHNIOlEHCBmdLOexDSk4kwUqvYv05chwziSXl8eo
	/6xuUN9zyvBAuhX2cYQhAmejIJeTGiaEdM7y/JU=
X-Google-Smtp-Source: AGHT+IHO4xXrBufwxhsjpWIE3nzW1wS+MvS5Val4ZHwvIwZeoNAme1IVqiu0lSEQ5YYea51HNN/HiA==
X-Received: by 2002:ac2:5b1b:0:b0:503:2924:f8dd with SMTP id v27-20020ac25b1b000000b005032924f8ddmr9809752lfn.47.1696681850000;
        Sat, 07 Oct 2023 05:30:50 -0700 (PDT)
Received: from [192.168.1.2] (c-21d3225c.014-348-6c756e10.bbcust.telenor.se. [92.34.211.33])
        by smtp.gmail.com with ESMTPSA id 28-20020ac25f5c000000b005068d6de988sm410569lfz.226.2023.10.07.05.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 05:30:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] Support byte access in the RTC7301 driver
Date: Sat, 07 Oct 2023 14:30:48 +0200
Message-Id: <20231007-rtc-7301-regwidth-v2-0-c913aa95f666@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHhPIWUC/32NQQ6CMBBFr0Jmbc1MCQquuIdhAXRoJzHUTAlqC
 He3cgB3//3kv79BYhVOcCs2UF4lSZwz2FMBY+hnz0ZcZrBoS2wsGV1Gcy0xB/YvcUswVA89cem
 Q3QB591Se5H04713mIGmJ+jkuVvq1/2wrGTTUIFbVhWoapvYhc6/xHNVDt+/7F/+9gUCzAAAA
To: Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, 
 Howard Harte <hharte@magicandroidapps.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This augments the Epson RTC7301 driver so that is supports
both 8bit byte and 32bit word access.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Specify that the reg-io-width default is 4 if not specified in the
  device tree.
- Fix spelling in driver comment.
- Print error and exit if an invalid width is specified.
- Link to v1: https://lore.kernel.org/r/20230921-rtc-7301-regwidth-v1-0-1900556181bf@linaro.org

---
Linus Walleij (2):
      rtc: rtc7301: Rewrite bindings in schema
      rtc: rtc7301: Support byte-addressed IO

 .../devicetree/bindings/rtc/epson,rtc7301.txt      | 16 -------
 .../devicetree/bindings/rtc/epson,rtc7301.yaml     | 50 ++++++++++++++++++++++
 drivers/rtc/rtc-r7301.c                            | 35 ++++++++++++++-
 3 files changed, 83 insertions(+), 18 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230921-rtc-7301-regwidth-18ba1e3d0edb

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


