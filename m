Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B68DA5BFD2E
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Sep 2022 13:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiIULqh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Sep 2022 07:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiIULqd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 21 Sep 2022 07:46:33 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873DC91D35
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 04:46:32 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id f14so8759612lfg.5
        for <linux-rtc@vger.kernel.org>; Wed, 21 Sep 2022 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PVynUZPTeDZvOWrl2DsqOeTAiiR8Z1VCqef0N17kBRA=;
        b=HoYTCsg8KkmNDgYwVfCqS5mwsgFGCQ9eUYjDfqRbglUByZ+Q2wIbXrRGdn4C2X9WQa
         eQwo90ETqZS5inSxJptZuB4KZRRtfHbk/1pPnmkZhtDuRoybIY3jG+OmGYFa6csRxNu0
         reei1M4idZ8rOekerYwvLNJuIIyt4RZP+Iulk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PVynUZPTeDZvOWrl2DsqOeTAiiR8Z1VCqef0N17kBRA=;
        b=iqbWcb90mGKeP/Hh6DcFOAYb4zOy4YWILDAyRqpF4qJGQtimG6TWaQDn4IMvQTySDX
         IZ7b3yAkPCsE+RItA72LzOUeTvbz/9vNmKFWUeaPKPemoNY6ztj6HjQpBAhWnkCxvZP6
         r/W8dfGmmKbY2DOBI1iqsVMEJlytvMa4NewP6yTYy5tMRgogo6pKf4JrxZt9KoJIz1CS
         aot9zS66NQIoY1tOjCXqRe8DY5Xn/ZwTWfSGX5TZmJ6W1ZDAjRkZKdOEMF5LvteQRhLf
         WJgF6wBnCLNUk1EIRS68Ab+njwb4H23Ue6t6oI/CsErPuqpFSC6f5D/7Ks7DHZ9UHYwI
         Hkjw==
X-Gm-Message-State: ACrzQf15/LsI7En5Ou/s4wlsXbQuWcxeImZkZuJlAfnpJ+Bfv3NuMI8z
        rTi8n8CZQi62Cmh0g4MI1iAQ7g==
X-Google-Smtp-Source: AMsMyM78ZuudZyneRMKz5lzq02tswtaF+BZuG4jff9Kcg31x6yedBHkEBZ8dz7R55jrUH37Ml90YHg==
X-Received: by 2002:ac2:51b8:0:b0:497:ac71:736a with SMTP id f24-20020ac251b8000000b00497ac71736amr10690217lfk.510.1663760790692;
        Wed, 21 Sep 2022 04:46:30 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id g4-20020a056512118400b00494618889c0sm405713lfr.42.2022.09.21.04.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 04:46:29 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 0/9] rtc: isl12022: cleanups and hwmon support
Date:   Wed, 21 Sep 2022 13:46:15 +0200
Message-Id: <20220921114624.3250848-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
References: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This series does a few cleanups of the isl12022 driver,

- removes use of deprecated function
- removes some redundant code
- switches to regmap API instead of private helpers

It also provides range_min, range_max values and finally hooks up the
temperatur sensor to hwmon.

Changes in v2:

- Use devm_hwmon_device_register_with_info() (Guenter), and use the
  opportunity to also expose an update_interval with the constant
  value 60000.

- Convert some dev_dbgs to use %ptR, remove a dev_info() (Alexandre)

- Add patch setting range_min, range_max (Alexandre)

Not changed in v2: For now, I've kept the low-battery
dev_warn(). Implementing support for the ioctls RTC_VL_READ/RTC_VL_CLR
is on my radar, but I will need some more time for reading up on and
deciding on the details of what the chip provides and how to map that
information to the various defined RTC_VL_* bits. I also need to
figure out a good way to reliably trigger a low-battery condition so I
can test the ioctl support. So I hope these patches can go in for now
and not be blocked on the series expanding even further.

Rasmus Villemoes (9):
  rtc: isl12022: stop using deprecated devm_rtc_device_register()
  rtc: isl12022: specify range_min and range_max
  rtc: isl12022: drop a dev_info()
  rtc: isl12022: simplify some expressions
  rtc: isl12022: use %ptR
  rtc: isl12022: use dev_set_drvdata() instead of i2c_set_clientdata()
  rtc: isl12022: drop redundant write to HR register
  rtc: isl12022: switch to using regmap API
  rtc: isl12022: add support for temperature sensor

 drivers/rtc/Kconfig        |   1 +
 drivers/rtc/rtc-isl12022.c | 237 ++++++++++++++++++++-----------------
 2 files changed, 131 insertions(+), 107 deletions(-)

-- 
2.37.2

