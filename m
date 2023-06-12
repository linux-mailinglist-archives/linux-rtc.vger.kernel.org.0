Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 283C172C322
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Jun 2023 13:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236158AbjFLLj2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Jun 2023 07:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233132AbjFLLiX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Jun 2023 07:38:23 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8927C46B2
        for <linux-rtc@vger.kernel.org>; Mon, 12 Jun 2023 04:31:04 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f62cf9755eso4832470e87.1
        for <linux-rtc@vger.kernel.org>; Mon, 12 Jun 2023 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1686569463; x=1689161463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3z9z5ciNoeXJ2AWju4rHjtXaiiOh78bIeWJwLTwus3M=;
        b=PPeFRKHdxjy3D5ZD4l2mgjjaksY35u80zNbT6FNhAi8LOtva4YfTWRzvqIvAiNp8MH
         YZQuLB53OKmCywz9oisNncIqXB/XZt95alq54zepd2gvJ1471ZfWJx1BR0xGLvGx4HaH
         e+M6VFNfn1OEViwKe5FQHqHevwKHY0DDSh/Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686569463; x=1689161463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3z9z5ciNoeXJ2AWju4rHjtXaiiOh78bIeWJwLTwus3M=;
        b=R7WQfEmC1SQkFLPxE5dnbUCaWpXHDIfjgIkbRzGwdofuUvZNXJafdRhqhJ8ASQtFqq
         U8Bv8iUmfsQr4CtSR4hqNEjlBPN5cfy1K/rGxy78TIX2zNcnppyH6p21hNCBHtREHhEC
         b3EENTSClY6Et43RoUkIz+Ik/P+UEW7pAlg+KRcNO7N47N20CiXECDdGWD+qMr160zdd
         0ZIvKj1fDM8Hy95+2O3yORdwJEZgWTLlrCp8bkkmOrjElJy7MIkI9zasvhTgEkp0AGou
         4BXBPv8rM9NWQybGkQ4MlTPYAoeSAru3IADTc7NSvtSMHxFhI1QegMAc9BQfCgP6iSJr
         zOoA==
X-Gm-Message-State: AC+VfDziGI4hGD0qDM//bwT97KgTf8iHalAuYJ7ajHqTK2QdyapAUGxm
        6/ostfQhLSHnsesTx1bELkfMqA==
X-Google-Smtp-Source: ACHHUZ4vxQLBHvJAPOH6+6IOEURSMyDzE9pPPiPn3nTWV28Z7V6rSyZLZVJpL/WPQay7byr7cmIzNQ==
X-Received: by 2002:a19:ab02:0:b0:4f5:1418:e230 with SMTP id u2-20020a19ab02000000b004f51418e230mr3740416lfe.52.1686569462822;
        Mon, 12 Jun 2023 04:31:02 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id w26-20020a19c51a000000b004edb8fac1cesm1399320lfe.215.2023.06.12.04.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 04:31:02 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] rtc: isl12022: battery backup voltage and clock support
Date:   Mon, 12 Jun 2023 13:30:50 +0200
Message-Id: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The current handling of the low-battery bits in the status register is
wrong. The first six patches fix that and implement proper support for
RTC_VL_READ.

The last two patches allow describing the isl12022 as a clock
provider, for now just as a fixed 32kHz clock. They are also
tangentially related to the backup battery, in that when the isl12022
is not used as a clock source, one can save some power consumption in
battery mode by setting the FOx bits to 0.


Rasmus Villemoes (8):
  rtc: isl12022: remove wrong warning for low battery level
  dt-bindings: rtc: Move isil,isl12022 from trivial-rtc.yaml into own
    schema file
  dt-bindings: rtc: isl12022: add bindings for battery alarm trip levels
  rtc: isl12022: add support for trip level DT bindings
  rtc: isl12022: implement RTC_VL_READ and RTC_VL_CLR ioctls
  rtc: isl12022: trigger battery level detection during probe
  dt-bindings: rtc: isl12022: add #clock-cells property
  rtc: isl12022: implement support for the #clock-cells DT property

 .../bindings/rtc/intersil,isl12022.yaml       |  66 +++++++++
 .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 -
 drivers/rtc/rtc-isl12022.c                    | 140 +++++++++++++++++-
 3 files changed, 200 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml

-- 
2.37.2

