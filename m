Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C7482DD953
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Dec 2020 20:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgLQT3C (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Dec 2020 14:29:02 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:46877 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727368AbgLQT3C (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Dec 2020 14:29:02 -0500
Received: by mail-oi1-f177.google.com with SMTP id q205so80613oig.13;
        Thu, 17 Dec 2020 11:28:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OIqxJlEr6qhscRY9Nj69alb23UGeDiYW09DXVg3bkF4=;
        b=ewxWi9CV7yLkhkmeXyjasmN4l/6tAAVlyKA9mGjbgwhU/w+KVP9YygSciECpWS8OHK
         9p1T++e/G+vSi4v9k0jYIP2Ecvht/MFleOS8lX1euh1EtGU1EB342kIUSoqJvXwBDvjg
         ao2kXCLYc0FN7dW8B49LCa0XTIqoH3Y/DMc6pZacT9V+DKAFh0AZ94OUuL0G1z4u2MJr
         UPOE9Dv2ZOqr94hEzLnT+j0c9xiPSh+qXD2oPwxwLAR5Ibv9EI3WXG5RC94hKuU9xEw6
         PAiI8Brxec+Vb62k+4jIu+HnfWAx8bqitO7S4kwk6OasnMsMqcLE0BiC3Lgem0nTcbdf
         26ug==
X-Gm-Message-State: AOAM533CICczxAKIJ1Gs+5CtQvmcD9zaITt5zNg1PXdoDOYMOBZrGDTu
        FFxsNkM3pzqGra/3W2Ut7g==
X-Google-Smtp-Source: ABdhPJw3bvC0XYf+pKjCMi2TrfV+zkB/AwPcr+ycvAdNFlDT5V1e88wLbTciwmx3HwL9jGOPY4nPEQ==
X-Received: by 2002:aca:3257:: with SMTP id y84mr518377oiy.132.1608233301052;
        Thu, 17 Dec 2020 11:28:21 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b25sm1497885ooe.18.2020.12.17.11.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 11:28:20 -0800 (PST)
Received: (nullmailer pid 101991 invoked by uid 1000);
        Thu, 17 Dec 2020 19:28:18 -0000
Date:   Thu, 17 Dec 2020 13:28:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, Ran Bi <ran.bi@mediatek.com>,
        srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
        Yuchen Huang <yuchen.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Lee Jones <lee.jones@linaro.org>,
        Fei Shao <fshao@chromium.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: mfd: Add compatible for the MediaTek
 MT6359 PMIC
Message-ID: <20201217192818.GA101889@robh.at.kernel.org>
References: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1608104827-7937-4-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608104827-7937-4-git-send-email-hsin-hsiung.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 16 Dec 2020 15:47:01 +0800, Hsin-Hsiung Wang wrote:
> This adds compatible for the MediaTek MT6359 PMIC.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

