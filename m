Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1444A89C27
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Aug 2019 13:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbfHLLAP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Aug 2019 07:00:15 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37799 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728010AbfHLLAP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Aug 2019 07:00:15 -0400
Received: by mail-wr1-f65.google.com with SMTP id z11so2224010wrt.4
        for <linux-rtc@vger.kernel.org>; Mon, 12 Aug 2019 04:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8QwbDdz8xqQedTgCl59sT1FB6qWBgfpvrd6AWSplSFM=;
        b=un9eNtBw+OwLU4ECOEq/jaCjwbqDOeyKlR1jeFZysKarWaE6LfHAgOtOToynNr73TD
         IZ8RZq2G/h9HmZnRr8fH+UdbzJ7j1OQuTnNMaM7uYcg75t14SgAdPY9xb+6btm5hMtD7
         cM1JOj4QSiFAo09HIW/yEprtgbD/yD2CipP/o9bOD1GAJ9px4//v9vxW3QEYa8TMGaqq
         gnZ5KsRxHaRN9gTZ6mYC2ocXexOr4l/Rb5JUtRUU9c+OkT1KiY0ros3uUgjcXImhsclZ
         qVIkzEq4vwaJXR3D53rcVvMFEhWfew+kbFWC33VcCJGkMJ2v7lyTkTXiBX7JRCc/YjbH
         Qehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=8QwbDdz8xqQedTgCl59sT1FB6qWBgfpvrd6AWSplSFM=;
        b=cfqW5e2m10cP2GR/RBx23yatgEeGt6gYLbgZpbIOQWi55z23IC186KcdnAZx8QBVno
         0Td6qo/x25IYvK4iVxcbht++E0PDGz9pePCFNW/9jiLLkARkL8ouhxDmM0mJ5AGryLOT
         fo+/GZVJL4dmf/PsaFZ9dOMNvFyXSQkLDEc/5WTwHZw5DDfaRf/ZMM8C92zar54dX7tZ
         NJdnWmkS9MnNr88uRQMFLg/YuRZH/duAkZNqOZTrvzaMvNYVWu1qyMx/d+xARMC1/OXD
         jrXW3Fqaq1XoKIDpn1VA8NjgbI8kZIhTRKV2U0GOW5hUmNVC0rQ6fjxOjbz6Ru3UE4Zl
         Vy7A==
X-Gm-Message-State: APjAAAVjUCxRnJuW0wlWLqHpHZvuWLMC2kMyUV3XHZAGNyr9c62+v3iL
        uXSXDWaOKHPuUq35xwF0M4lVSQ==
X-Google-Smtp-Source: APXvYqwghxYdeRuqVzPuYU2ropqG0cb6TCIVcqdi0Kn7ZW3EZH/gvO+aYyOhLrZXyhKsuMQmxwRNAw==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr39714762wru.280.1565607612886;
        Mon, 12 Aug 2019 04:00:12 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id k124sm20536169wmk.47.2019.08.12.04.00.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 04:00:12 -0700 (PDT)
Date:   Mon, 12 Aug 2019 12:00:10 +0100
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
Subject: Re: [PATCH v4 03/10] mfd: mt6397: modify suspend/resume behavior
Message-ID: <20190812110010.GQ26727@dell>
References: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1564982518-32163-4-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1564982518-32163-4-git-send-email-hsin-hsiung.wang@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 05 Aug 2019, Hsin-Hsiung Wang wrote:

> Some pmics don't need backup interrupt settings, so we change to use
> pm notifier for the pmics which are necessary to store settings.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c       | 89 +++++++++++++++++------------------------
>  drivers/mfd/mt6397-irq.c        | 33 +++++++++++++++
>  include/linux/mfd/mt6397/core.h |  3 ++
>  3 files changed, 73 insertions(+), 52 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
