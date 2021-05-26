Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA71B391DC3
	for <lists+linux-rtc@lfdr.de>; Wed, 26 May 2021 19:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbhEZRWX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 26 May 2021 13:22:23 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36675 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234094AbhEZRWT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 26 May 2021 13:22:19 -0400
Received: from mail-vs1-f71.google.com ([209.85.217.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llxD4-0003Sp-M8
        for linux-rtc@vger.kernel.org; Wed, 26 May 2021 17:20:46 +0000
Received: by mail-vs1-f71.google.com with SMTP id v15-20020a67c00f0000b029023607a23f3dso554151vsi.10
        for <linux-rtc@vger.kernel.org>; Wed, 26 May 2021 10:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iu90w1RN/NgPKQZcOE+tYtYndkYqjFREoyVTDiCy85c=;
        b=L98eNbcJYloKU8/Rrb0WYpGpsFpp7FQxQs3tz9q/53ZEH8jMOlBwfcJv0QnHcLlfYh
         7knuq8mKYvtuhqEGKItDfnvjUxSeOIY+Xj29v+cAneie33gzbsyQ7S+wLpOSr+3whnI9
         kSxo0o3LWMSh/5bRqHM8GSqhl33slkpNxUZrBUQtM1uJi5ZmLEDmSeg8N9PQuBD7IkwD
         Eht9QS0MoV8wcEEkVmnNRDiEDmMRheCASAsF8LqoI2etP3cP6Hm/ur3ZNcsXGhigD81X
         heRbqQ6WDXAzKi2Lt4bu4r9cCf3RqYFDe2EHPtVpl6RqDs/MCQr4sfQIEZfsvAYE2otY
         1w+w==
X-Gm-Message-State: AOAM5305UjsgfjbveszhgCimrBOO0HY0qzVjQboZTc/hdsi2vaebFvj9
        YBmqDnNKneaEjaE/lycl5Huuh3JCt9vobLimOemB2jKL109kOxDahSWuqHTkxX9ZoOFg+55EieR
        Nldx+324X5G5nL+i7YEgSjtgW8EM//+shQb5DCg==
X-Received: by 2002:a9f:2404:: with SMTP id 4mr33747724uaq.48.1622049645786;
        Wed, 26 May 2021 10:20:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze5V+MJ/4OmRium3GPvko310K8oOb/8zoCmZM316VMsekfJVF2t10PZ+IL1ycCaV8/jRxp5Q==
X-Received: by 2002:a9f:2404:: with SMTP id 4mr33747689uaq.48.1622049645594;
        Wed, 26 May 2021 10:20:45 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id u195sm2036032vsc.10.2021.05.26.10.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:20:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v2 0/7] mfd/power/rtc: Do not enforce (incorrect) interrupt trigger type
Date:   Wed, 26 May 2021 13:20:29 -0400
Message-Id: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

This is a v2 with only minor changes:
1. Drop patches which landed in mainline.
2. Add acks.
3. Rebase max17040 power supply (dtschema conversion).

Patches are independent and there are no external dependencies, so
please pick up freely.

Best regards,
Krzysztof


Krzysztof Kozlowski (7):
  mfd: sec-irq: Do not enforce (incorrect) interrupt trigger type
  mfd: max77686: Do not enforce (incorrect) interrupt trigger type
  mfd: max77693: Do not enforce (incorrect) interrupt trigger type
  mfd: max14577: Do not enforce (incorrect) interrupt trigger type
  rtc: max77686: Do not enforce (incorrect) interrupt trigger type
  power: supply: max17042: Do not enforce (incorrect) interrupt trigger
    type
  power: supply: max17040: Do not enforce (incorrect) interrupt trigger
    type

 .../devicetree/bindings/clock/maxim,max77686.txt     |  4 ++--
 Documentation/devicetree/bindings/mfd/max14577.txt   |  4 ++--
 Documentation/devicetree/bindings/mfd/max77686.txt   |  2 +-
 Documentation/devicetree/bindings/mfd/max77693.txt   |  2 +-
 .../bindings/power/supply/maxim,max17040.yaml        |  2 +-
 .../devicetree/bindings/regulator/max77686.txt       |  2 +-
 drivers/mfd/max14577.c                               |  6 +++---
 drivers/mfd/max77686.c                               |  3 +--
 drivers/mfd/max77693.c                               | 12 ++++--------
 drivers/mfd/sec-irq.c                                |  3 +--
 drivers/power/supply/max17040_battery.c              |  4 +---
 drivers/power/supply/max17042_battery.c              |  2 +-
 drivers/rtc/rtc-max77686.c                           |  4 ++--
 13 files changed, 21 insertions(+), 29 deletions(-)

-- 
2.27.0

