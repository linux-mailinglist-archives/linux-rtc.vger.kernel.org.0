Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF6D1B96A
	for <lists+linux-rtc@lfdr.de>; Mon, 13 May 2019 17:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbfEMPEX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 May 2019 11:04:23 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41566 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730209AbfEMPEX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 May 2019 11:04:23 -0400
Received: by mail-oi1-f195.google.com with SMTP id y10so9541079oia.8;
        Mon, 13 May 2019 08:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ai6rjPFrafyd6umFHEjlpBi/HrKqyBzAzERgqLZhf2g=;
        b=nZv+310tUbMrs3XRCk7suGnrRLStfP4tUtSVD4w9CcoBG+fF0jHi2akF2lTkSZuWYo
         BgB88tsdJ6qSe3ELc5IstRvYyxbGsQhPeY2i3uC0hyL/BuUC+5BZYdhx6YeJdOncImd2
         7eyK1j0jxIYyiOVkpmRZdd+s0JNRCWbunHYcN1Sy1SuBBMb1hO5DCDajShg+lRceZgD+
         k/O8JTsnFpcwu2DJta5h8QhDcndQdTGTSVUovhitVbwDRfl458LS9rjnauwwfVSmjBBD
         KxnNjJEcWn3Vdkgeqr1gM66WiB6eZSlyVCGEm0VmNV6/obamdGaeruuUox7mrtZBB5h9
         Z7Ew==
X-Gm-Message-State: APjAAAXmejc2dFmWkcub1TGYtNjy5jIL/3Zjyv/WopXy9IiCOLN4CqEZ
        JpIrvfdfzBMc1IoJaJJbSA==
X-Google-Smtp-Source: APXvYqxVXfjOnWaZN5e9dSjye6lhc3XyeNNDviJ/wA+MXXfwKmpzGSqIuCkQvL/GtWBR1trD1GIH4w==
X-Received: by 2002:aca:c794:: with SMTP id x142mr5118647oif.172.1557759862144;
        Mon, 13 May 2019 08:04:22 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v6sm4954890otk.53.2019.05.13.08.04.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 08:04:21 -0700 (PDT)
Date:   Mon, 13 May 2019 10:04:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH v3 04/10] dt-bindings: mfd: Add compatible for the
 MediaTek MT6358 PMIC
Message-ID: <20190513150420.GA16152@bogus>
References: <20190503093117.54830-1-hsin-hsiung.wang@mediatek.com>
 <20190503093117.54830-5-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503093117.54830-5-hsin-hsiung.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, May 03, 2019 at 05:31:11PM +0800, Hsin-Hsiung Wang wrote:
> This adds compatible for the MediaTek MT6358 PMIC.
> 
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
