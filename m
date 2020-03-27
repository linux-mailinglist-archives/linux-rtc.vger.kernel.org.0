Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4E0219556F
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Mar 2020 11:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbgC0KkB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 27 Mar 2020 06:40:01 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32996 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726450AbgC0KkA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 27 Mar 2020 06:40:00 -0400
Received: by mail-wr1-f65.google.com with SMTP id a25so10845170wrd.0
        for <linux-rtc@vger.kernel.org>; Fri, 27 Mar 2020 03:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hUy8CSxiwxtlSvFdhJfOQOxn+8kEeA3/QOE0g86x3DY=;
        b=LMxxjnWHsVPWoK+YealyJ9Y8VXYAU9t0UsEYeUXuUR6Kew3uePNv32seA9fjNqon+b
         uKpgsUP3PLmbQwwhR2nGysLvWXcqVaYGhAvXiI15N8rxlWciMQWG/KcpXGRlWQpXvMbD
         RVtEo241nEUUlqhor80ruIxUeVG3aaorxDTsvOsB9vIFYbqkiJl1Pqqd+D0Yy7eMMI9N
         Qg3fNLmNm7A/O55vwlpdITkGRbG7ojljbzonQ4My13PQK/K3+3D+YmKSL0S4/AbMzliq
         qioniwV77ZESN3EwdzImhbFexw5sbgGBNGrFPYs18SKLkJTQpHsVMFSvYh0qVZmZxkT5
         CIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hUy8CSxiwxtlSvFdhJfOQOxn+8kEeA3/QOE0g86x3DY=;
        b=dYdNRtWKxPOwtJxm2wlgD0sLfoRJd+q5Vw3Ir4Q85al8oZnJr58epkjU+lhrr9mB4A
         3vRbUADC2C5beD0MnmdXtPgqV3bjCvS4TAsc8CswsML6X+nu0u5EffXo2O/LLJDr6cBt
         k1efLITwhaItk2hyV9cE/FWzZLgI1+KJMeLfeFZofGFnIVz7SjAVZ2DpjbZBIg8gytL3
         9uJTctF11VTkh8GHLOfJH2afwNxIKMN29Ng5+RTyCqp1oZR+oJJgLINH+cKZNLw4R+0/
         aY/al8lswwCH2E7dF1tfY3BeiLkL/B0mMUbX0+5ejSXKSqU8NgetUzLGtMLQzkKnLqA4
         XPuw==
X-Gm-Message-State: ANhLgQ3fTZE0xtOXNpWpo0sI0OuMfMEp8yKCOuzclfMGgD4bdkRj5JZD
        0+psrcrRyygpJqQNKh7qyuJEyQ==
X-Google-Smtp-Source: ADFU+vu2K+4IxFs7+VvXvZAHHpSGTr0Ruak97rimwwt4gOR55rJ8O0ACPtX5CuXxCIq/LRKi6XwULw==
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr14511489wro.415.1585305598986;
        Fri, 27 Mar 2020 03:39:58 -0700 (PDT)
Received: from dell ([95.149.164.95])
        by smtp.gmail.com with ESMTPSA id x206sm7522623wmg.17.2020.03.27.03.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 03:39:58 -0700 (PDT)
Date:   Fri, 27 Mar 2020 10:40:49 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org, knaack.h@gmx.de, lars@metafoo.de,
        pmeerw@pmeerw.net, linux-iio@vger.kernel.org, jic23@kernel.org
Subject: [GIT PULL] Immutable branch between MFD, IIO and RTC due for the
 v5.7 merge window
Message-ID: <20200327104049.GB3383@dell>
References: <20200320081105.12026-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200320081105.12026-1-andreas@kemnade.info>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Enjoy!

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-iio-rtc-5.7

for you to fetch changes up to 7858658cdcab7ca8057444b1d24c6a28ddaa8589:

  mfd: rn5t618: Cleanup i2c_device_id (2020-03-27 09:42:44 +0000)

----------------------------------------------------------------
Andreas Kemnade (7):
      dt-bindings: mfd: rn5t618: Document optional property interrupts
      mfd: rn5t618: Add IRQ support
      mfd: rn5t618: Add RTC related registers
      mfd: rn5t618: Add more subdevices
      rtc: rc5t619: Add Ricoh RC5T619 RTC driver
      iio: adc: rn5t618: Add ADC driver for RN5T618/RC5T619
      mfd: rn5t618: Cleanup i2c_device_id

 Documentation/devicetree/bindings/mfd/rn5t618.txt |   4 +
 drivers/iio/adc/Kconfig                           |  10 +
 drivers/iio/adc/Makefile                          |   1 +
 drivers/iio/adc/rn5t618-adc.c                     | 256 +++++++++++++
 drivers/mfd/Kconfig                               |   1 +
 drivers/mfd/rn5t618.c                             | 109 +++++-
 drivers/rtc/Kconfig                               |  10 +
 drivers/rtc/Makefile                              |   1 +
 drivers/rtc/rtc-rc5t619.c                         | 444 ++++++++++++++++++++++
 include/linux/mfd/rn5t618.h                       |  26 ++
 10 files changed, 851 insertions(+), 11 deletions(-)
 create mode 100644 drivers/iio/adc/rn5t618-adc.c
 create mode 100644 drivers/rtc/rtc-rc5t619.c

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
