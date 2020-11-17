Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38FF72B5E1D
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Nov 2020 12:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727286AbgKQLRj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Nov 2020 06:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727321AbgKQLRi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Nov 2020 06:17:38 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D33C0613CF;
        Tue, 17 Nov 2020 03:17:38 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id f12so272528pjp.4;
        Tue, 17 Nov 2020 03:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ZCCPiSWQrBmevXeisQYoV5Y6G+oKsD5D3odFep4g6o=;
        b=reU9JPjfXNeIXlL3q2tyZpzGwtJRSfZDI/u+/s8LeWzB4Ya23KxvIOXY7VsCsZ7W5F
         kWCl614hcNr9yHEEQ+eHLk0wub4Lds3N8MX12GXzWpHbPTrVr6qyEbrOu0U9Z0ra0NjB
         q01maz1eKc1WNZy8q9X/6SBP6qPSNPGoi1NZSg17VwE8YRKBh6AOQyyrdWsZlLl7X2RA
         0G1j9pHC0MVsRA0LSQ1VPFwdugVhsj9FbgVZAl+NNE1tnT/Oc8KQJBPPfKnoYvvrwMi4
         JtlWWL/inzLf9U+wYUWbehzTRKR0NslJkMDQMhIxGPmfbQaeBEPcLyY4Lf2cqANXjfz3
         XK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ZCCPiSWQrBmevXeisQYoV5Y6G+oKsD5D3odFep4g6o=;
        b=q1JoFNCMJJO5PXVjslxKphQ1qwAhraDfZC8gEIg0k61f0u+sXE2MabXz77Dj6h81F7
         RXOGiI96PacFySkW0ffR8QP6QCQVUQKmBvY8rn94f+h5EDL4Sc/ravp6oVKGEyDmMP5T
         8JCPO05SSJQeaaYCBAednoHkNB1v9VlNXKBRb46Fp3qLChzBSmADNmhkTkzBdyXFxFYN
         W3h64UE82XOOy6Nx5isOBAlUxv9ihlSv+An3X4nu1l9pAvhMK5WfKyElIh4OU+MxrMfw
         rOkCAO8GLqk1uR2+VOtNykOZNoHoOznEZujhF0Gnsp4Ximp+F8e4LBbqqWcIxOcEkRnf
         Ko8Q==
X-Gm-Message-State: AOAM5328MkJdYXoA5pSpK6fNGoNmrsBADDTK0PsAzv/BscNPkxlO/XyB
        itzZil+jm7QsZ4jvStZ04ft6LDxnCFRzpodpBZ4=
X-Google-Smtp-Source: ABdhPJwBY5g3q0T/tKuDq76sK6g7VqZs8W3NP3aTJ0Yy2xJkzcFMnBof5HzJmN4WMVaE7UQ61x5QSrwOhbfbBSCNiTg=
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id
 d10-20020a170902aa8ab02900d3c9dd77d1mr16842801plr.0.1605611854546; Tue, 17
 Nov 2020 03:17:34 -0800 (PST)
MIME-Version: 1.0
References: <20201112130734.331094-1-ch@denx.de> <20201112130734.331094-3-ch@denx.de>
 <20201116144631.GB1689012@smile.fi.intel.com> <20201116163024.74c767b6@md1za8fc.ad001.siemens.net>
 <AM0PR10MB316964C5127D27DC9D7C3DCCE7E20@AM0PR10MB3169.EURPRD10.PROD.OUTLOOK.COM>
 <CAHp75Ve3UuzRj+0GNRT__XriuYihGx5sLjDYG=JMFooy=4j_dQ@mail.gmail.com>
In-Reply-To: <CAHp75Ve3UuzRj+0GNRT__XriuYihGx5sLjDYG=JMFooy=4j_dQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 17 Nov 2020 13:17:18 +0200
Message-ID: <CAHp75Vdunx0pjwKBXv5OEjHk_E=sAu_N4xyCBRFoU3GKK8nnnA@mail.gmail.com>
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

On Tue, Nov 17, 2020 at 1:10 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Nov 17, 2020 at 9:39 AM johannes-hahn@siemens.com
> <johannes-hahn@siemens.com> wrote:
> >
> > Hello Andy,
> >
> > when comparing the ACPI IDs used in rtc-ds1307.c, which is already on mainline
> >
> > https://elixir.bootlin.com/linux/latest/source/drivers/rtc/rtc-ds1307.c#L1141
> >
> > for example. Every ID listed there is also not formatted the ACPI ID , PNP ID way defined in the ACPI spec.
> >
> > How about that ?
>
> Bad examples should not prevent you from doing the right thing, correct?
>
> JFYI: https://lore.kernel.org/linux-rtc/20201116142859.31257-1-andriy.shevchenko@linux.intel.com/

Moreover, this seems to be the last driver which was broken by the
same guy who "invented" ACPI IDs for them. The rest had been reverted
already.

-- 
With Best Regards,
Andy Shevchenko
