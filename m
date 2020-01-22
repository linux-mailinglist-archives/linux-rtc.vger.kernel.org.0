Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 156A8145ADB
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Jan 2020 18:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgAVRck (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 22 Jan 2020 12:32:40 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:46156 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgAVRck (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 22 Jan 2020 12:32:40 -0500
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <guilherme.piccoli@canonical.com>)
        id 1iuJrq-0004v3-4G
        for linux-rtc@vger.kernel.org; Wed, 22 Jan 2020 17:32:38 +0000
Received: by mail-wm1-f69.google.com with SMTP id n17so177837wmk.1
        for <linux-rtc@vger.kernel.org>; Wed, 22 Jan 2020 09:32:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BIslLaqj+vyuv3BVVYE2LqHuQAp3bmHqGuKswAtJrHo=;
        b=ucID5xi0avOEkgpXrx070MejTWwp65zFR5fMj6e3RPc4e7duWy2XWkTrZc4yit4gRy
         7K+7iRgAhrAwO7gIEJWekI8QhJffHucJB6CSRz4XEBLD9sDEBMR+WrnpCyDlulT/5sH1
         /mYoI15ZMtC/NdWyIACK+BMwejcsdQPlXdlGjJEcS05wfY4xAHMQJLzdb+T2y2f6nJyI
         FWnEB5Pq4ebmZ0JoFq5OGF/rqwlHMU16GnFHEZmOFgZic5yt/ScZyjJCRvr6ZGM/tF75
         IYnmnqZu2/oFqr1M+uHAm5B3i4SHlCdruTr89HTHUznt0ixE5h4HYR1nHUxmjbjbz5Ev
         7XpA==
X-Gm-Message-State: APjAAAXqddEsqXBXT+AL+RjIM8mmOtLMLpvAOCZZtTr4EfW9PNLpMfhq
        9LRDeMQHPfRSqF9VeqSSjBKpHuiCcjRsjtz6uefpUrQ/MqA5qA7Mmpbg0E4FXY1rO8JEsdJ+3c9
        /d52yPcNgIVcpd3SlqZ/6tlk+txHkeFfoXYA0FJSgzpiBPFTI2WYM4g==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr12197777wrm.131.1579714357865;
        Wed, 22 Jan 2020 09:32:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzF6D0d424s6ai8zZounvbVwwPuAA/gLzKlhbyKEkXAv7h8YStS1O4idh50Ur3qlg9wlN6oAqbaGsO8+hDcfPc=
X-Received: by 2002:adf:dd52:: with SMTP id u18mr12197758wrm.131.1579714357701;
 Wed, 22 Jan 2020 09:32:37 -0800 (PST)
MIME-Version: 1.0
References: <20200122144529.30307-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200122144529.30307-1-andriy.shevchenko@linux.intel.com>
From:   Guilherme Piccoli <gpiccoli@canonical.com>
Date:   Wed, 22 Jan 2020 14:32:01 -0300
Message-ID: <CAHD1Q_y2+DVPmqVLuSSqi6NQg8cTa2sbOWSQxGA_eqU6gQM5Bg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] rtc: cmos: Stop using shared IRQ
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Jan 22, 2020 at 11:45 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> [...]

Thank you Andy, great and simple series! I've tested that on top of
5.5-rc7 and it's working fine with "irqpoll" enabled.
Feel free to add my:

Tested-by: Guilherme G. Piccoli <gpiccoli@canonical.com>

The only oddity here is about the scissors, I'm not sure how it is
supposed to work on git, but when I git am'ed the patch, the commit
message was only "As reported by Guilherme G. Piccoli:", everything
else was dropped.
Cheers,


Guilherme
