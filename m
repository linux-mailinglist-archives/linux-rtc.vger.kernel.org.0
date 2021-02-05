Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A053A311A3C
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Feb 2021 04:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhBFDhP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 Feb 2021 22:37:15 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:35350 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbhBFDfJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 Feb 2021 22:35:09 -0500
Received: by mail-oi1-f176.google.com with SMTP id w8so9720974oie.2;
        Fri, 05 Feb 2021 19:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oYX3STVGOutn/ODTJ1Chx6wd1ikGLIpdQAWlo27fcnA=;
        b=P/tmvMNJuCuqeky6J0kl0Kj1FLXJrI6DbCiAoZ274C7A4WTyk2uLzxl+LKN7kDMYzp
         fQdHe4ZHjIp/K4xG0g45oblqhLfZL9P/oQ9fnjDp4a02Y/5VnowiUiL18s/AAubCOZBP
         QLj2aKwmq+meqg60tlD+/PajmOFUlN3Ns38A+WnIdQAJ5BRI0VMW0aTvpriLtUSEMZLj
         o/kSf2iyTANckXVa15Z8WULqesTu2yQdTO3BSbVUuixzohYwxH76z5SHz4sWQMxupss0
         9ArTEOdoSaTROnG9MNc2u3RxTryhDJWvB+WijT33vgP6z1mDiCQKFENC/naBSgeCOlAm
         p49w==
X-Gm-Message-State: AOAM530erH1pbtNZAgpnrFXgHOyb+/S0D9/b/X7SKVpNqimfbrrN3urP
        BuczDvVF1VijgIm/jXqOMF9iuUWJWA==
X-Google-Smtp-Source: ABdhPJx7yvm1O6oqJ0lLXbtfmYGfoeVWzvCVL9cCxLieYLbGmE6b1ddW84xEXKVGBDviVnEhIIsV6Q==
X-Received: by 2002:a05:6808:918:: with SMTP id w24mr4534554oih.20.1612562677933;
        Fri, 05 Feb 2021 14:04:37 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u15sm1970378oiu.28.2021.02.05.14.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 14:04:36 -0800 (PST)
Received: (nullmailer pid 3833547 invoked by uid 1000);
        Fri, 05 Feb 2021 22:04:34 -0000
Date:   Fri, 5 Feb 2021 16:04:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     linux-kernel@vger.kernel.org, Ran Bi <ran.bi@mediatek.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        srv_heupstream@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Fei Shao <fshao@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Yuchen Huang <yuchen.huang@mediatek.com>,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH RESEND v5 3/8] dt-bindings: mfd: Add compatible for the
 MediaTek MT6359 PMIC
Message-ID: <20210205220434.GA3833495@robh.at.kernel.org>
References: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1611913781-23460-4-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611913781-23460-4-git-send-email-hsin-hsiung.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 29 Jan 2021 17:49:36 +0800, Hsin-Hsiung Wang wrote:
> This adds compatible for the MediaTek MT6359 PMIC.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v4:
> - remove unused compatible name.
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
