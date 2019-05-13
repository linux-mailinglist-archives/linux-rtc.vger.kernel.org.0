Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4521B97E
	for <lists+linux-rtc@lfdr.de>; Mon, 13 May 2019 17:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729596AbfEMPGE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 May 2019 11:06:04 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39160 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728659AbfEMPGD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 May 2019 11:06:03 -0400
Received: by mail-ot1-f66.google.com with SMTP id r7so7567268otn.6;
        Mon, 13 May 2019 08:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bKxni4Tnr4JV/OACFJaw+XVWF/+XkwKuGUE+XE3uQeA=;
        b=oSMzCMK3+G+J3Ysy045aBRdNxHryn4kqr9UOg2aLVL5fHoBDCxOIE2LSBRVpuwY+N/
         x3Kk4L1h1YYNOFmTRmMmCKEc13jMnsz6WkwU9F1qRMq9AK5Kh8yBGiD5sUawIYdRPIwE
         4BJ5eNdRIkH4KIK9ZDVoCCiY+fWt1SB3iaI+PFODH61rNJrAvKU1yqPpQwBJAd/EVW4j
         uYaZfiXb2cMjd2MqqhIrXuAtjT8fHGksT0BlNziRSTuxCIzeOarPz04r8VYYkI7buAjr
         QYFs9taf7Gw0tXvbBLN6xikW9YnNPBI+ndTmIROJX4mmsJXVaLXYPx9PIzm09beASmBB
         g3pg==
X-Gm-Message-State: APjAAAXV127AKgILGHkx59+TY8BBiA7geQeHISvWGVi4/X0t5c5hNdnD
        r8EYfG/jDvTlbHSjm7LAvg==
X-Google-Smtp-Source: APXvYqw/GihQMP21orlofX8NqbcrIV1iCJZoSvbgR6Y1E26mr/GcNPDvJQkTbd5Rg6WgZ+e95G+xuQ==
X-Received: by 2002:a9d:4808:: with SMTP id c8mr2532355otf.316.1557759962932;
        Mon, 13 May 2019 08:06:02 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w142sm1648584oie.15.2019.05.13.08.06.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 08:06:02 -0700 (PDT)
Date:   Mon, 13 May 2019 10:06:01 -0500
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
Subject: Re: [PATCH v3 05/10] regulator: Add document for MT6358 regulator
Message-ID: <20190513150601.GA21798@bogus>
References: <20190503093117.54830-1-hsin-hsiung.wang@mediatek.com>
 <20190503093117.54830-6-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503093117.54830-6-hsin-hsiung.wang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, May 03, 2019 at 05:31:12PM +0800, Hsin-Hsiung Wang wrote:
> add dt-binding document for MediaTek MT6358 PMIC
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/regulator/mt6358-regulator.txt   | 358 ++++++++++++++++++
>  1 file changed, 358 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6358-regulator.txt

Reviewed-by: Rob Herring <robh@kernel.org>
