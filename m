Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6B0E70CD9
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jul 2019 00:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729252AbfGVWvm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jul 2019 18:51:42 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:32919 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728529AbfGVWvm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Jul 2019 18:51:42 -0400
Received: by mail-io1-f67.google.com with SMTP id z3so77730643iog.0;
        Mon, 22 Jul 2019 15:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sYRqGzsa2Mqfa8UCEWc+Q6d3arkBPq6mEZsIpfw+fso=;
        b=nFDQJHVRhOLRyaiT1zjKy46M7vIugomAzSolqlUdVYh5NSK7epDlEqva304RVtfaxO
         vhyD5341lLbIpcnmMD+DJkSGYFpyy53Ij1lVBvIsSMK91Sglixk6Km+RUYAphu8kiWDN
         Z19O6IXUdMVnQqD1qClEC1or95/uN/j2vdjfa7dpAriogpr/SQMF0Rweh7Wg0hQZbaXm
         EooLb7zvEphmUrtoqsztLOaCLXcnJY98VXakQ76RhOOeIyMAytPJXZ+/j5gK0Q8PRac0
         CQI6UCW8+xWWHc0lxNKkDlRlAjliKQVfUJ3dr77zHmqGQnuM/v6kBZPP+hbDsZJaLmm2
         am6A==
X-Gm-Message-State: APjAAAV+1zEzs1bnZyi9rj8mw+7k3fajDyscGO1jPiMly5VR1s5qgSev
        hqU8iiy8PDj5TCnWBp8Xeg==
X-Google-Smtp-Source: APXvYqxFG3cem2D0uzg43tQTtA1WyJdJngPhgAlqWXVNUVcQmwLGOFIjnFebC9eNH3FaJ4tc0VmjRg==
X-Received: by 2002:a5d:8d12:: with SMTP id p18mr65859087ioj.251.1563835901424;
        Mon, 22 Jul 2019 15:51:41 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id k5sm46038653ioj.47.2019.07.22.15.51.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 15:51:40 -0700 (PDT)
Date:   Mon, 22 Jul 2019 16:51:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ran Bi <ran.bi@mediatek.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        YT Shen <yt.shen@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Flora Fu <flora.fu@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Ran Bi <ran.bi@mediatek.com>
Subject: Re: [PATCH 1/3] bindings: rtc: add bindings for MT2712 RTC
Message-ID: <20190722225140.GA30571@bogus>
References: <20190702032120.16539-1-ran.bi@mediatek.com>
 <20190702032120.16539-2-ran.bi@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702032120.16539-2-ran.bi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 2 Jul 2019 11:21:18 +0800, Ran Bi wrote:
> Document the binding for MT2712 RTC implemented by rtc-mt2712.
> 
> Signed-off-by: Ran Bi <ran.bi@mediatek.com>
> ---
>  .../devicetree/bindings/rtc/rtc-mt2712.txt         | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mt2712.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
