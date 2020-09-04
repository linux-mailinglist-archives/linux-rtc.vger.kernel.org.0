Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9E025DD15
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Sep 2020 17:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730784AbgIDPVl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Sep 2020 11:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730300AbgIDPVX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Sep 2020 11:21:23 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC930C061245
        for <linux-rtc@vger.kernel.org>; Fri,  4 Sep 2020 08:21:22 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id l9so6441795wme.3
        for <linux-rtc@vger.kernel.org>; Fri, 04 Sep 2020 08:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfRaAqp3OgjGxvZ6ZiPUlMAqHAnRFTh/qzWgN99UzoE=;
        b=u+d1PKxaZI8J7CeYyknjN5dfzohO5raZMCHbiSOj+CRu4VDW8f6mW86jheDqyQoCXQ
         +3gTlXHx5xtRmK4TQWdRVye12qJlTYSEq3GCmfLa0drg4TR62tLLPS51CVqz05FacN/8
         hzCy6YfeQ3OgGb3mjeB2fZnVJnmrd8/vcX5+dh4oUN/msUgQWCKLHbLtZtsLd1Smjg0U
         kur+fvienUgiFlNfbYCAkXEBdsjlxja/hyFIRlwyryFLXWRGM9eqTuFCgGo2vB+tPp5P
         /vd80JDEyPvFXBlhf4GD6N4sOxulQ6KdhA1rWF8rZbtI2GOmTMkwdYn9e/kGuOtnf28V
         L0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hfRaAqp3OgjGxvZ6ZiPUlMAqHAnRFTh/qzWgN99UzoE=;
        b=EvFJQ5ggZWbwmpnmEUVq5lUWHLyA5voO/jWZA215fJwetBcFnX/ytkSF2b3Bmuimps
         I1BgeYKYnV8ysuEu1YIOQuJG/D52i9MqoG1IXYoI7x1kzrdNwoVeiK2oZ4O0h206CCFm
         NnkyQtB+xhiMT8dm2saQYqP9Dp/amMt/aEfGb5ABnLBNZheJ3tPFe6LTGWlAq4ouAxcC
         fckJgWTqMM23bqhsdiXr5pJVaeOxaEEIwuk5UW8x0x7icwsu0N5BxRkBkt0M+ojQt8Wt
         Xegh7AJBFMv9H3dr94U4Z/m1xtyGW6DYZFgGFox4v2GzI4ZQaUBtz1STcn3pmC/1mJPj
         0AMA==
X-Gm-Message-State: AOAM5317OKhQYCppRT3v5Fv9jzQMxuS8Pj59Eu32EpLlgU7aicKKQTOY
        WtxzqFIfszEDNoQ1fU2jyqGorg==
X-Google-Smtp-Source: ABdhPJyCH37zL+tUESIsCO7mNsVMKzn9QEqlxHXsRD32f8aoYoOwks1RV08plAOhs3KCjOxNXcC+fg==
X-Received: by 2002:a05:600c:2215:: with SMTP id z21mr8067728wml.176.1599232880578;
        Fri, 04 Sep 2020 08:21:20 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id a11sm7789534wmm.18.2020.09.04.08.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:21:19 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/8] rtc: rx8010: use regmap instead of i2c smbus API
Date:   Fri,  4 Sep 2020 17:21:08 +0200
Message-Id: <20200904152116.2157-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I want to use this driver on a platform where the i2c controller doesn't
speak SMBUS. This series converts the driver to i2c regmap which can
figure out the correct protocol to use.

First 7 patches are just cleanups and some refactoring. The actual
conversion happens in patch 8.

Bartosz Golaszewski (8):
  rtc: rx8010: remove unnecessary parentheses
  rtc: rx8010: consolidate local variables of the same type
  rtc: rx8010: use tabs for instead of spaces for code formatting
  rtc: rx8010: rename ret to err in rx8010_set_time()
  rtc: rx8010: don't use magic values for time buffer length
  rtc: rx8010: drop unnecessary initialization
  rtc: rx8010: fix indentation in probe()
  rtc: rx8010: convert to using regmap

 drivers/rtc/rtc-rx8010.c | 284 +++++++++++++++++----------------------
 1 file changed, 120 insertions(+), 164 deletions(-)

-- 
2.26.1

