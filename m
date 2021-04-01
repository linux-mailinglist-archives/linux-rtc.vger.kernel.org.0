Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652CF351C77
	for <lists+linux-rtc@lfdr.de>; Thu,  1 Apr 2021 20:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235368AbhDASRq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 1 Apr 2021 14:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238081AbhDASFX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 1 Apr 2021 14:05:23 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A102BC02FEBF;
        Thu,  1 Apr 2021 09:36:42 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id l12-20020a9d6a8c0000b0290238e0f9f0d8so2635030otq.8;
        Thu, 01 Apr 2021 09:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZPH3WCM/TnePh08egpPl8mvTJ2h76XFtwQZcEwnvobU=;
        b=Z4eyObNkvVq2hQ1m7y4mhL53Ft61sAgRtZs60BOjBuyJZPaKGc5SAjBFSWQPQW5xNQ
         l/x8p+OByfkUEb5ghBUtlqQvnh9U4PurgZ1SuCwzJeUSGuGSvuYvo49tn77gux/HthQO
         qBUIDyiCI2C5vbD/mkm7HukxUpWo0ANT2VXjlbMoMsGfqODkSbwO3wiCFrd2ab9LAWZv
         zxzKDEpOXaTLVhmISLCQif+1voRwZECdoAwCws1DEYFTzpPfS56G4uuRXkybA4vGMs0x
         4MwvS/+p7xyMkwGVFOs3I8OdIqf/SM40FqA+9GuBIa3AR+2Nty4+RCpgzB2VLz2uvYQo
         wAuQ==
X-Gm-Message-State: AOAM533/s3Hnkt5YVZG2Q4Urm0zsW4bhu4u0ErzlhTSTz20hkctXpZgm
        oI7ydyS6SHOvag1FFU2Gog==
X-Google-Smtp-Source: ABdhPJzry24ZspFgMJWJqJTiORUFoP+9mVcfOtgexiVOhccs/HM2asz2P93i6hp+ssr6h7AsACWdoA==
X-Received: by 2002:a9d:6e18:: with SMTP id e24mr7715273otr.284.1617295001957;
        Thu, 01 Apr 2021 09:36:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o6sm1317748otj.81.2021.04.01.09.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 09:36:41 -0700 (PDT)
Received: (nullmailer pid 570452 invoked by uid 1000);
        Thu, 01 Apr 2021 16:36:40 -0000
Date:   Thu, 1 Apr 2021 11:36:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Fei Shao <fshao@chromium.org>,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Rob Herring <robh+dt@kernel.org>,
        Eddie Huang <eddie.huang@mediatek.com>,
        linux-rtc@vger.kernel.org, Ran Bi <ran.bi@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v7 4/8] dt-bindings: regulator: Add document for MT6359
 regulator
Message-ID: <20210401163640.GA562289@robh.at.kernel.org>
References: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1617188527-3392-5-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617188527-3392-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 31 Mar 2021 19:02:03 +0800, Hsin-Hsiung Wang wrote:
> add dt-binding document for MediaTek MT6359 PMIC
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v6:
> - fix yaml error.
> ---
>  .../bindings/regulator/mt6359-regulator.yaml  | 385 ++++++++++++++++++
>  1 file changed, 385 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
