Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94797A534A
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2019 11:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730446AbfIBJtP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Sep 2019 05:49:15 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53013 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730275AbfIBJtP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 Sep 2019 05:49:15 -0400
Received: by mail-wm1-f67.google.com with SMTP id t17so13820696wmi.2
        for <linux-rtc@vger.kernel.org>; Mon, 02 Sep 2019 02:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=XaAC2UGpsh6Rl+xXtvt/zZ4Jj3WqlV6FbUQcE8k/OFE=;
        b=Fcsdc6RsuDuPiLa9pJ8ykgClftxCpIfBC4pIswB4N3NPQ/dju7ZCK2iNiSXswtyj/X
         onUbd2EYdbmi/UWWCD7zjcsDPMiG5XTAZG76ZhDiq630WGO0CJ8ctok2U9T1ws4CnIU0
         cd3LpxfkhDnVpdEAWCsJdlssixcxlRXmQZ1SgJxhMvp6UL07wzmdGcltI4n1yoGAaKlG
         tiqXclivUmF51+g3TukhyPU3JUJgXZGsqRjz3I/oPR6umzQZhomRnzIifIH0Wg2XqCkm
         5/WO/rUvC8XJPuBpPPRUeI8swzV5ri0OYmpkoQCaKoLzDV61bygBpJmLoi9eMqsfA+qB
         2q5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=XaAC2UGpsh6Rl+xXtvt/zZ4Jj3WqlV6FbUQcE8k/OFE=;
        b=X69fEnnJqfjf+ZfL9uDhucIs9VUOHSkucseAx7/n5xjcOBlIc7dg2v8aNWKRVbLzZz
         aGc8xyK2vx5srElqpxBXxis+Nt8zAEGHJmJ/E1cb9/rpH+BqZwhbR1rNE+n2BjXyzAZH
         KZ4a7A26Npbdwn/1u++Y1lvCUuXFYEbkFEUEH0QuMnV5NLv7W6j2uXkWBgB5nKFBYXMm
         6xfByEdScmrcN2+aR42NGStJiqStnQiqcpaDOLH5iCOY0r3CPqy7s8wpnHO4XnWL+j3C
         wBgKDTTiQv4PKpt620J1dV1UuFGHmX5ct6dc1Q3sWfIN5Xe7GaLSucQDCVJh+Ma1GhO8
         p90g==
X-Gm-Message-State: APjAAAX4yI7dV2B214CF6EUTUy+g24PrKseOsVJt0jKmhnAcGIdZzONz
        2hHPcR6nudC4KCw0BzC2BTUqKg==
X-Google-Smtp-Source: APXvYqyAb3NYJI26X7MqFVxjVL23b6sr38r91MjidNGuAZG0y8cjvNgpZZPuH9ZCIogojja2cubR/w==
X-Received: by 2002:a7b:cf37:: with SMTP id m23mr7434346wmg.53.1567417753357;
        Mon, 02 Sep 2019 02:49:13 -0700 (PDT)
Received: from dell ([95.147.198.93])
        by smtp.gmail.com with ESMTPSA id n12sm19426057wmc.24.2019.09.02.02.49.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 02:49:12 -0700 (PDT)
Date:   Mon, 2 Sep 2019 10:49:11 +0100
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
Subject: Re: [PATCH v6 06/13] mfd: mt6397: add mutex include
Message-ID: <20190902094911.GT32232@dell>
References: <20190818135611.7776-1-frank-w@public-files.de>
 <20190818135611.7776-7-frank-w@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190818135611.7776-7-frank-w@public-files.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 18 Aug 2019, Frank Wunderlich wrote:

> From: Josef Friedl <josef.friedl@speed.at>
> 
> add missing mutex.h

In future, please use correct English grammar in commit messages.

I will fix them for this submission.

> Signed-off-by: Josef Friedl <josef.friedl@speed.at>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> changes since v5: separated from "power: reset: add driver for mt6323 poweroff"
> ---
>  include/linux/mfd/mt6397/core.h | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
