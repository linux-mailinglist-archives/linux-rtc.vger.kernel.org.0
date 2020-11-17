Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0622B5E09
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 12:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbgKQLLF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 06:11:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727214AbgKQLLE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 06:11:04 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA1EC0613CF;
        Tue, 17 Nov 2020 03:11:04 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id a18so17081096pfl.3;
        Tue, 17 Nov 2020 03:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pIwP/qFwnBLD+oPTw1kSA2+OGFpTVI9bS1ER2i+57dk=;
        b=JJohZP+qoVsw2y0PW5daTNosizS27Wrl8lr5x0kaxYG5FO1p+vKRFgZ+SdYJtviO/4
         ztG4C8dUoVm/psjO77uJUBhMPAF8dibuCuguQy7SV0ph5x7TcoaaamnzFqizK/thxzaC
         U1V0HCQNVSyhJrG1Xfy6LjBXNNZEeKKQjNndFUrWmeSoQsoJDkeqiDlDdcY7OhDCOCmE
         dWppO/uAXXUwTElMLphZDaoeWi5d+WOlgjsfA9KozHkbNhMI4r2Yommp0VYKjxoGp1LY
         L4zIx9XECvtbcHlVFqNC+eLAkD5sc1ke0IdE+zFL4V091FaoR5MuGwDEdlfw49E/7FVv
         iIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pIwP/qFwnBLD+oPTw1kSA2+OGFpTVI9bS1ER2i+57dk=;
        b=fV4m398KyTKV+DUkY9bQcKis0syHzhAugEhjPI3dFkdUpl0LkOK4oOwjE2sT3UvrbP
         VdamkRmzkv/9RLqn9yA+irdq3xcPMVlXLxWmPlaE3X3YvQbBNP2CIv7eDgIQSQVc6jG5
         KeX6sN9civvvE0OnQblBY89q/bFVEwMNVcLelfGyPZ4jkeGlL0D0sNW2Br+ACvw6TSFR
         2uW4mYmFZhFAVwyXm1h59MJMaQFvLFQLfWmHfkJDQJd4ly54EcWcfBVcXKwlhVGKp9ia
         tKzqtwrZSBZNRKm7bQusl6CkdrSK0F6g3tANJp/6nKKWHVoSGJpHM+kyj9x8PhNW3QKv
         6Ebg==
X-Gm-Message-State: AOAM530hLMgbMlWd6rnF259yH/RRiwYm+xfEDe0XlHUlk9RZ2jBEFbSh
        pY60K9vHz9Mswg26vcNvhiFmujuaHgQ6ZIqYUl4=
X-Google-Smtp-Source: ABdhPJwCYvRc/HQBxZ6xAksYzWsA9HF55QAGZR7ISArQT8QBE24DlxMNGF8gVjiI1QsUWI1ZmImcrAnhkcUj6XmEW58=
X-Received: by 2002:a63:3e05:: with SMTP id l5mr3017553pga.74.1605611464473;
 Tue, 17 Nov 2020 03:11:04 -0800 (PST)
MIME-Version: 1.0
References: <20201112130734.331094-1-ch@denx.de> <20201112130734.331094-3-ch@denx.de>
 <20201116144631.GB1689012@smile.fi.intel.com> <20201116163024.74c767b6@md1za8fc.ad001.siemens.net>
 <AM0PR10MB316964C5127D27DC9D7C3DCCE7E20@AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM0PR10MB316964C5127D27DC9D7C3DCCE7E20@AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 17 Nov 2020 13:10:48 +0200
Message-ID: <CAHp75Ve3UuzRj+0GNRT__XriuYihGx5sLjDYG=JMFooy=4j_dQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rtc: rx6110: add ACPI bindings to I2C
To:     "johannes-hahn@siemens.com" <johannes-hahn@siemens.com>
Cc:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Claudius Heine <ch@denx.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "werner.zeh@siemens.com" <werner.zeh@siemens.com>,
        "henning.schild@siemens.com" <henning.schild@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Nov 17, 2020 at 9:39 AM johannes-hahn@siemens.com
<johannes-hahn@siemens.com> wrote:
>
> Hello Andy,
>
> when comparing the ACPI IDs used in rtc-ds1307.c, which is already on mainline
>
> https://elixir.bootlin.com/linux/latest/source/drivers/rtc/rtc-ds1307.c#L1141
>
> for example. Every ID listed there is also not formatted the ACPI ID , PNP ID way defined in the ACPI spec.
>
> How about that ?

Bad examples should not prevent you from doing the right thing, correct?

JFYI: https://lore.kernel.org/linux-rtc/20201116142859.31257-1-andriy.shevchenko@linux.intel.com/


-- 
With Best Regards,
Andy Shevchenko
