Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21182FE9EC
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Jan 2021 13:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730963AbhAUMYc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Jan 2021 07:24:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730084AbhAUMYH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Jan 2021 07:24:07 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B89C0613D3
        for <linux-rtc@vger.kernel.org>; Thu, 21 Jan 2021 04:23:26 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id v67so2252500lfa.0
        for <linux-rtc@vger.kernel.org>; Thu, 21 Jan 2021 04:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5fcGiD7OwR1/jKyiV2ZSUx3opsk7q8xBXMeaqlhO/Z0=;
        b=VCfb+xDMRVyqrMJlzKVRriQ7XncA/ZJvY01+z0RJ0M/9cEUbd+GV10httUkReMk81o
         6i1fR2lVm7rCPBgPPDYwV2QSxTTpsFCUi8X/mgmT5HMUQ74mh0x3GbTuj/tEGW8altsW
         E9vSZ4frIMrRDopfC0eGQDXuXq5QquXGkvjUmqrM+f/1eF23OWBVEjg14T+fzSzDT9yL
         WVjUBAxHOt8Q3AMoM4tghFwbLywfivk584kyQ3Ntn+4BdOD8u1+xeRMa/VCN33N9Ypok
         aMwY10h6RiJr4pGhXqJjECtsx/cVZvQSYqMnBkqFDRs+LaQdM4pC9id5XbGi+/EoLDSF
         1ovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5fcGiD7OwR1/jKyiV2ZSUx3opsk7q8xBXMeaqlhO/Z0=;
        b=BJiAjM9eoo0RbAKMgHMojZ/ubzIS0pXYkhziBINPkL4ipRlmIYXFDIzDlMSn7+h9Om
         8rYN3CtWQChrhkeu2pcJxz+x6AcRwZcY6O/U+LjmvwUr+oo5paPviraZnSaXQMdU6Mpe
         iCHTVer9SPdCLoVPC/jq06blPOUJRR020nWyL6H/hejzlitwxRcM6mZxhUyAAkI+Br4F
         aWzg0hJ/Z27OGIBncy4tz4C07Pa0GrMIl8p46lZaZhXDPGetBoIudozVWpZYUHlH3T01
         U2wiDQ+XlgYPX33x4ASrAWtP94jPjcfA5TF7V416JEeeM38EjUk2nrM6fw2WKk4Ud0Ai
         Bzew==
X-Gm-Message-State: AOAM532XaBZPOPnKx/yXVY3ovtS7LYzloDftfXOkRS+fSF17aCsSJ10U
        1oIHTVOELGDN4Kf4lZa672+p9tX5C9R2/4Da+PWTxN45aTHz8A==
X-Google-Smtp-Source: ABdhPJyVkr58ajloKJ5wJplZwsXm0JgXkDYNE2LbP4m5olsHGtdSAnryYXTR/OLfKzwabv0Y5/p0tjh07D+mo5oE6V4=
X-Received: by 2002:a05:6512:74e:: with SMTP id c14mr6668456lfs.529.1611231803244;
 Thu, 21 Jan 2021 04:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20210120154158.1860736-1-arnd@kernel.org> <20210120154158.1860736-3-arnd@kernel.org>
In-Reply-To: <20210120154158.1860736-3-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 13:23:12 +0100
Message-ID: <CACRpkdYqijxwE8=441+i4t7A7WuCiQocCy5Q4sOrJKrg-S6fbg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rtc: remove ste coh901 driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Jan 20, 2021 at 4:42 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The ST-Ericsson U300 platform is getting removed, so this driver is no
> longer needed.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
