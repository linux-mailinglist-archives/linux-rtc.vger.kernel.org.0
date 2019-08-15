Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D43E8F035
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Aug 2019 18:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfHOQMG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Aug 2019 12:12:06 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46752 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729151AbfHOQMG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Aug 2019 12:12:06 -0400
Received: by mail-ed1-f66.google.com with SMTP id z51so2516774edz.13;
        Thu, 15 Aug 2019 09:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vqg8jCVCDmAfYzzLTMscq/wtLhxGOuHTYA6VgxmCpW8=;
        b=n02VPGA4JxD51TRTSuHpsB+2sXO4+U7wYJw0XMTyM7w+GBXwIlUqCezdArqMVjR1pA
         C8F0vl4ITzVUdWNFYyQCjQRrq2u3BErN/syjcZOYtiZ2W46ORMdQ0YK7HRIOx1SylGEh
         cHJa43bNFA+U7ss72FDRajK2TN9cjtNF1LzqFx+qVVO0z0NnHdzDbTmTkUnxlTAL9WT0
         TnGkcYjpdLFWLCDcyex6XssKHMwtlgnjBmts2Mnl2eZ9Xy3WYVVBZIxQz5XXPSS1tcTx
         /vw4xWXyzAOdE+qem0GTFXy8SXiAEuAI484o2ySKAMRnykufNAmww6c1qoTWN3D7Ar6R
         UuLg==
X-Gm-Message-State: APjAAAXAGqS4yiE7/geY0ELN4NcqpgkqVr7aNdxWdjE1XqUvskvTblrI
        xUuAcOJrCqBcIFJ0ZWyvjXDZLiPbzNI=
X-Google-Smtp-Source: APXvYqwJQnizYCCP6PkE+pfyvtZTH7thCeiZKWITryhSlw+h474hxGV1gvnWHY3yqpzaBY1upfYkSg==
X-Received: by 2002:a17:906:3396:: with SMTP id v22mr5224309eja.152.1565885523759;
        Thu, 15 Aug 2019 09:12:03 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id v6sm432342ejx.28.2019.08.15.09.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 09:12:03 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id b16so2679260wrq.9;
        Thu, 15 Aug 2019 09:12:03 -0700 (PDT)
X-Received: by 2002:a5d:568e:: with SMTP id f14mr6068714wrv.167.1565885523165;
 Thu, 15 Aug 2019 09:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190815160020.183334-1-sboyd@kernel.org> <20190815160020.183334-4-sboyd@kernel.org>
In-Reply-To: <20190815160020.183334-4-sboyd@kernel.org>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Fri, 16 Aug 2019 00:11:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v6689RaJwiQ=XgY7uCGhqZCzSAeZ9MRVxzj0Vc6sf-dsPQ@mail.gmail.com>
Message-ID: <CAGb2v6689RaJwiQ=XgY7uCGhqZCzSAeZ9MRVxzj0Vc6sf-dsPQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] rtc: sun6i: Don't reference clk_init_data after registration
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>, linux-rtc@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Aug 16, 2019 at 12:00 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> A future patch is going to change semantics of clk_register() so that
> clk_hw::init is guaranteed to be NULL after a clk is registered. Avoid
> referencing this member here so that we don't run into NULL pointer
> exceptions.
>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
