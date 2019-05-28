Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0428E2BDC4
	for <lists+linux-rtc@lfdr.de>; Tue, 28 May 2019 05:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbfE1Dd6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 27 May 2019 23:33:58 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35799 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfE1Dd6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 27 May 2019 23:33:58 -0400
Received: by mail-ed1-f66.google.com with SMTP id p26so29497581edr.2;
        Mon, 27 May 2019 20:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rvzFBTjaElqc0TlPvT5ZP31SDS65m0GKWeHyTHmPU+A=;
        b=N2uJo0+0Ii43gOjzX7xj7sFeoZBSaX4jAWswKAENhxvrR2b6q3sSb+sq8xvnXLs0VL
         X675g12Uyw93otWyBK7T9HfYA3mSspVlhvSaiISC2n6Hx3qhJHiyEItvpBw2zfjyEr69
         NtPRvRMM2MptEnU42LTDAzE66eLCSN14zhNddITpAqSly52s1bd667MI+MKMVt7JZbRg
         1aqOpNCWV6XE/xw0wPzX5y4sjAp2Rk1zNllnR2l2PV51DtrT1d7MAnH6+yaSNWkXJ9K6
         Mcuq/v/es4YYXTsGqBLKGvc2jy21s2X/8C9Uroapoe9WpFvLUGjrsi27wrl760AV/ysi
         SSAw==
X-Gm-Message-State: APjAAAXjkGM/CxIllF8H+4UT0Wnh7SUpNIEmnJo8wcPWvIf/yIfcgzum
        Fh3oaCUAz2e4/zqs/rOZ1/3pYu6GqHw=
X-Google-Smtp-Source: APXvYqyzWVVctV6F0QaK1W+KzJbUU8HVE93by9+ij5ZPONNZBeo02WHp0bZH209F/jzuQ4slbWL5vg==
X-Received: by 2002:a50:ce06:: with SMTP id y6mr20906771edi.160.1559014436018;
        Mon, 27 May 2019 20:33:56 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id h25sm2002900ejz.10.2019.05.27.20.33.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 20:33:55 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id l2so18510636wrb.9;
        Mon, 27 May 2019 20:33:55 -0700 (PDT)
X-Received: by 2002:a5d:49d0:: with SMTP id t16mr14186512wrs.324.1559014435157;
 Mon, 27 May 2019 20:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <290402405a34506997fd2fab2c4c1486dbe6b7e5.1558958381.git-series.maxime.ripard@bootlin.com>
 <bd3004d8e2d52c96abbc6cc9ca51b8fea510446a.1558958381.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <bd3004d8e2d52c96abbc6cc9ca51b8fea510446a.1558958381.git-series.maxime.ripard@bootlin.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Tue, 28 May 2019 11:33:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v64qDdrejF_9p0s+S0jXj=JuCx1QpiThniurrPzg3ua6ww@mail.gmail.com>
Message-ID: <CAGb2v64qDdrejF_9p0s+S0jXj=JuCx1QpiThniurrPzg3ua6ww@mail.gmail.com>
Subject: Re: [PATCH 03/10] dt-bindings: rtc: Convert Allwinner A10 RTC to a schema
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, May 27, 2019 at 8:00 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The older Allwinner SoCs have an embedded RTC supported in Linux, with a
> matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
