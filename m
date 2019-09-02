Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2BC1A5362
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2019 11:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731010AbfIBJuF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Sep 2019 05:50:05 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36290 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731005AbfIBJuF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 Sep 2019 05:50:05 -0400
Received: by mail-wr1-f66.google.com with SMTP id y19so13331360wrd.3
        for <linux-rtc@vger.kernel.org>; Mon, 02 Sep 2019 02:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=z/iNfh9lERKCL4WNCXIHABmMvr8yzyMTtcia6mN52EQ=;
        b=F3ev0/94Lp7tRgH5QkOB7GchzXuzea7zDMr/QPIscw1kwGvE47q6u3+dDwu3Iu12WC
         gbNy68B9TnB61ZUYtjULImN4UGYq4IsfRXjBdyRPJDKodTe+woG/43DGOEka+gy4L8Ks
         y+zQf9aCd9hE9KlB2Vhl70ew//mw+HIjbwA5bjVMM4hV7ZAAE3u8eKUA/DpLqdDmsnWy
         LVs1P90/kjUlAnPerYhSn30AYhNIrcJCd0W0+X7eMOV/bANxa67nRPY7BHFSFjUVVMt2
         VihWvo4ntzvGsFSkTSkWXyxvgRnWflTJTq5QU80FbvrbeeWj1rJBHCB2PgMaYT0oGZa/
         Lv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=z/iNfh9lERKCL4WNCXIHABmMvr8yzyMTtcia6mN52EQ=;
        b=iXfjVat4La6lZOizPctpdLvU97feFeV+O9jsty/FAmED9PUqnfNPVck0J9AMASyugg
         A4zqsiTc8XI7rFUJxFFcdNkOdyex+og6+In1436xqmh1+DmVQl72Tu+XaTwxLkA2Ix25
         ES9KOYVLsODrigS/Y2XDmJURCWuMctMq3F0ktKCRA4Zv6V3Xaz1/k3DtiJ62qBySZ05c
         adj+9oqOOxCRVrN5JuZRQVftjPr/VvVJ8PQWzRQDr+UGJgY4shAuLmnzzo0be+yKW6EY
         G8ykfjvPdNWuyc25S4QC/KDpXNgzjjqd0sxGba5AmZ1Ctm3pw40b4+Z0i+y4k0W0/VUy
         U3mA==
X-Gm-Message-State: APjAAAWl6MmBSTHYJZXl6K5Bd4GyzvWhnCT9WoECerVkSa8GlhUi1rff
        6wD0iK8dz17bJYRYpcubM9NPHA==
X-Google-Smtp-Source: APXvYqzKfwhjRcpSww0X5JvjADuGYoZnJVDaisET7pRsBYvpYFMr7Bmpd+NM8IppVRkyGVrVHrE3rQ==
X-Received: by 2002:a5d:4f05:: with SMTP id c5mr31271928wru.349.1567417803097;
        Mon, 02 Sep 2019 02:50:03 -0700 (PDT)
Received: from dell ([95.147.198.93])
        by smtp.gmail.com with ESMTPSA id y3sm28567157wmg.2.2019.09.02.02.50.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 02:50:02 -0700 (PDT)
Date:   Mon, 2 Sep 2019 10:50:01 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Frank Wunderlich <frank-w@public-files.de>
Cc:     linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        "linux-arm-kernel @ lists . infradead . org Alessandro Zummo" 
        <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Josef Friedl <josef.friedl@speed.at>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tianping Fang <tianping.fang@mediatek.com>
Subject: Re: [PATCH v6 10/13] mfd: mt6323: add mt6323 rtc+pwrc
Message-ID: <20190902095001.GV32232@dell>
References: <20190818135611.7776-1-frank-w@public-files.de>
 <20190818135611.7776-11-frank-w@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190818135611.7776-11-frank-w@public-files.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 18 Aug 2019, Frank Wunderlich wrote:

> From: Josef Friedl <josef.friedl@speed.at>
> 
> add entry for rtc and power-controller to mt6323
> 
> Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
> changes since v5: none
> changes since v4: none
> changes since v3: none
> changes since v2: only splitting, second part of v2 part 4
> ---
>  drivers/mfd/mt6397-core.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
