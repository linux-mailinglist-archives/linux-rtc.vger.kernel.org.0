Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB7BE89C25
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Aug 2019 13:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbfHLLAB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 07:00:01 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40147 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbfHLLAB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Aug 2019 07:00:01 -0400
Received: by mail-wr1-f68.google.com with SMTP id r1so5073103wrl.7
        for <linux-rtc@vger.kernel.org>; Mon, 12 Aug 2019 04:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Se9XSbsfGDt4BhyzlQIMi1S9/MkvfhBPx11WicajSSg=;
        b=yaHiSpqBDdc2sT6zI2Dw8zIEtpSIuQSkOCCSmj9RJNlb1WEg3hBK3DieiAioZ8alKu
         AhP6xz8HC1xq2zeOzZD/CESJhRrdOgr9LS9ALNZnKZ7qQmpeLUV9bDwnT3EpLlwruIiP
         qw6Wfo9LBJzqQuQkLSFwdLolV8LwmnGKEdztwiHvhxo4Su+Amv+FnsR+5zM2D+cajBpc
         ylXscLIIU6eUjTydGSw0LQX8ETWkvZ56eeYt1TiS0+Pe7xUOVQiHuRDq1jqfF+s8ugmx
         Yb3gupA+zwYIsrVaxjBkVmzYbfHGadHGrRwNto9vTAoF1Gi8UzYRJPde3HbA0jbocbzQ
         ck9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Se9XSbsfGDt4BhyzlQIMi1S9/MkvfhBPx11WicajSSg=;
        b=oXmqkswdtszRVpFRhO5mEhTkTo8nc1QdDAFnok+cFq6V9U1DsfxYJFJL3o1kW5ITyo
         f9ldLAzv0oEtObW2Pmn0v/H0V6lH3h7satqRw2N3WLV5JoMBkDqyFHqoz1WMY/fvQTl8
         d9VSbAfGSfKlUZB4iHVWP/NipxDNV506prgIqp7qywoYV2P9tAaIVBh8ANrLJohZiUqb
         9PGlnv3e909x7BobH7XFG0SjXXl7HIXusevIOtmGOMAZMFGB0jU2TkwWzZsJXwGAPwrN
         kvwCADji159YkpjarK+yJdI26G0rDqinfOxFpw5I6F1ZaP204axGms0egzgk5lNg/UHd
         5y9g==
X-Gm-Message-State: APjAAAUHFM+j0oRNA4H9r87VKbspRdq2FKl1oBEfmAcumEqssCGIcJbM
        mXTPauhFzN5rK4Z4jVfzaWFcmQ==
X-Google-Smtp-Source: APXvYqz8c1NJgqCLXi1ZOgbjqMY0Kt0jc3i39Y6I1YxE2q8hdoWNcdXIgZA0cAg94/5QZFrH+80nhg==
X-Received: by 2002:adf:dc51:: with SMTP id m17mr41748135wrj.256.1565607599334;
        Mon, 12 Aug 2019 03:59:59 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id a81sm5608087wma.3.2019.08.12.03.59.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 03:59:58 -0700 (PDT)
Date:   Mon, 12 Aug 2019 11:59:57 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
Subject: Re: [PATCH v4 02/10] mfd: mt6397: extract irq related code from core
 driver
Message-ID: <20190812105957.GP26727@dell>
References: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1564982518-32163-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1564982518-32163-3-git-send-email-hsin-hsiung.wang@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 05 Aug 2019, Hsin-Hsiung Wang wrote:

> In order to support different types of irq design, we decide to add
> separate irq drivers for different design and keep mt6397 mfd core
> simple and reusable to all generations of PMICs so far.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/Makefile            |   3 +-
>  drivers/mfd/mt6397-core.c       | 146 --------------------------------
>  drivers/mfd/mt6397-irq.c        | 181 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h |   9 ++
>  4 files changed, 192 insertions(+), 147 deletions(-)
>  create mode 100644 drivers/mfd/mt6397-irq.c

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
