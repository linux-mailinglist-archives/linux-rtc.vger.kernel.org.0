Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAC141BEA
	for <lists+linux-rtc@lfdr.de>; Wed, 12 Jun 2019 08:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730868AbfFLGDc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 Jun 2019 02:03:32 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42776 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730865AbfFLGDc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 Jun 2019 02:03:32 -0400
Received: by mail-wr1-f66.google.com with SMTP id x17so161234wrl.9
        for <linux-rtc@vger.kernel.org>; Tue, 11 Jun 2019 23:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+13q810llW4ErXXIetgj/sg6McW6pFvv2Q8IXgzsfkA=;
        b=kQgNEe7lU75z3OeBABAC6Q8trmmoqyeiGjh+GcqkEXYi72whxbc7gOEEHkeVhfjLhN
         FU8ME53uN7CbcnKand3X6rJlYfGiD+5rRC+f/oCFUZmtLHbic1O7pMQlI9E3n0Z7uLtl
         HqKADy95Q0V50tbehahY8zw/vnxoekQFiAQj6rg/4AwpzP410tAT4Dp5UC2K7d9UunNu
         4L7jAh2jHoyUmhZzm90OIv/UXl1bZCLFjbZU8XKncBBv/I75Z86NRu71gLyMuFWB5uY3
         zOYgwcDKZxQuPwetUB8A7f8OkJBhV4OugGkt76kHe7JTrlethDQpEDis/afWlkOOHl8J
         56uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+13q810llW4ErXXIetgj/sg6McW6pFvv2Q8IXgzsfkA=;
        b=rOH6kFC98necqUtmm0+ay8NwRRwDG5nnMGZ3x8oAYGGoogA5/MDyhfyrP+5eBahBVU
         gCyrvkVwMfMwKm28CywK6NoAIUikY1jpENlWDJWExhULxA5xXIp4yg0DbPmK9aXvHTuf
         jtpbbghpN52y3qbp7+HoaOboiKwiOQf47pGA/I+b291menlO3YFS4H0/d7GAmbdDFkHV
         6lLWbj52KAqbAOHmF6kMh+SwkLkO+/vtAwEUFunhGYoM4keV+ADf4+IIXOFctSxZz7Tf
         nTw3pcqal138iIKgkK0SB119/3vFBiY5uXwMmLaqANjTZ5JY8+OciMqL19U5aaC0pkra
         9Anw==
X-Gm-Message-State: APjAAAW4+8VpPt4LWMZgqg8CIixstUpsRVhK/Tkz+YwnZm+VMmhw1wpW
        jpa2ViSfcDdeVq8WXJrkyBwWyQ==
X-Google-Smtp-Source: APXvYqyxgC+MOxZ/tRXB4Hv5XucD8WakihBGUs4FQKs/N+4M4iopyF7/hlrp1gR87azKIfrbFj6+Bw==
X-Received: by 2002:a5d:4703:: with SMTP id y3mr669507wrq.248.1560319410440;
        Tue, 11 Jun 2019 23:03:30 -0700 (PDT)
Received: from dell ([2.27.35.243])
        by smtp.gmail.com with ESMTPSA id w6sm23656976wro.71.2019.06.11.23.03.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 23:03:29 -0700 (PDT)
Date:   Wed, 12 Jun 2019 07:03:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v15 0/7] support ROHM BD70528 PMIC
Message-ID: <20190612060328.GQ4797@dell>
References: <cover.1559546139.git.matti.vaittinen@fi.rohmeurope.com>
 <20190611200043.eib3g3acc7ilawsx@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190611200043.eib3g3acc7ilawsx@earth.universe>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 11 Jun 2019, Sebastian Reichel wrote:

> Hi,
> 
> On Mon, Jun 03, 2019 at 10:23:37AM +0300, Matti Vaittinen wrote:
> > Patch series introducing support for ROHM BD70528 PMIC
> > [...]
> 
> I think all patches have been reviewed by the respective subsystem
> maintainers. Lee, can you provide an immutable branch with the MFD
> patches (1, 2, 4)? Looks like the other patches only depend on those
> and can go through their respective subsystems.

Yes.  It's on my TODO list.

Would you prefer this method over me just taking them all and sending
out a PR?  The latter is my usual flow, but I'm happy with either.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
