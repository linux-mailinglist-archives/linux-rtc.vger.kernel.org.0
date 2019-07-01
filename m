Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE36B176BF
	for <lists+linux-rtc@lfdr.de>; Wed,  8 May 2019 13:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbfEHLZL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 8 May 2019 07:25:11 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37502 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727504AbfEHLZK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 8 May 2019 07:25:10 -0400
Received: by mail-wm1-f65.google.com with SMTP id y5so2783859wma.2
        for <linux-rtc@vger.kernel.org>; Wed, 08 May 2019 04:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=nHpH5BJT4ukjqZLM4x5WXkpHa9unxL5O+4Tbg9kVipM=;
        b=dgnO15oJXiu0un1tNiOF9+URBOhLf0lNoJGXZ4lUfKgyz2D3LLQpC4JpibRI6dA5Ge
         3BrAJ7xVgqKvKA4JJAMx4BChrFwO9n8LmMHnDIsmaO0Ydgt4teedjZDIsOH5VNV84D3n
         tjHEbTv1OUnIzA+39WPDjozckAhqXiJ9KS1KU18p9fSsE8doq0iIQW1X1YrOoqNMJi58
         0DAHMZL0TO3lpIJ7TYlmC9LqsK9Y29CD5N3VwtHlNu5XCdxJpBMasFuvc79SglUgfPP2
         l+NuwekRXO1Xg9Vc3iv+tRhmY/XBMZSZfu/jRsbogtKUq5vcNZcXMOo+EwYQWEf/L2qT
         k96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=nHpH5BJT4ukjqZLM4x5WXkpHa9unxL5O+4Tbg9kVipM=;
        b=ZtFAy4MmOoEJHpul/5yfM0OqtlE6sVkLfEiEg4vXe+kIRs80qCghyhZZ7MoVN+bp2B
         SX5Sx4kUb/Molct36TXcti5W+v4p5Q4mXlUvZyo4M2kKFQntiJiBXM9L7M/uSmlexff1
         QqV/6TcGvVvpEy7DfNoVShcBhqOatCli4ym+wf5BS/C1iXjlDaKXaBsiXufwZv2kNJR3
         3GhZtpoR6Re8YYZCRh2dpINTGJq7to8If9Ypn5ZBHkSdAJyLyV8/pgZfMeX80+A+Egml
         ivsslKlCXPzFMxmIZzxnYluOlLiGKHAvbmkZwkNIPhZJi7gVhbfIBODO86ZatyZqAh4+
         2/Tg==
X-Gm-Message-State: APjAAAVpKh2Q1rBZSRE4W+pbp7HAgb4zyTkgJOX5ei1gsp+ebRydNWBx
        xKBDwNbnvzvObXQMWWIxt3lUZ9suEMs=
X-Google-Smtp-Source: APXvYqxgR0a3KAApIHOtMFlYhCjZPTnoZ3wDQ0TcrIoUeLJlXNX6+9pGL1pYuIhUlc2JIJbWw+Wk/A==
X-Received: by 2002:a1c:a914:: with SMTP id s20mr2738339wme.55.1557314709078;
        Wed, 08 May 2019 04:25:09 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id c20sm19431364wre.28.2019.05.08.04.25.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 04:25:08 -0700 (PDT)
Date:   Wed, 8 May 2019 12:25:06 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
Subject: Re: [PATCH v14 4/8] dt-bindings: mfd: Document first ROHM BD70528
 bindings
Message-ID: <20190508112506.GV3995@dell>
References: <cover.1556787930.git.matti.vaittinen@fi.rohmeurope.com>
 <37014b510628fbb5cfb9bbd3481d02005d98ba0b.1556787930.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37014b510628fbb5cfb9bbd3481d02005d98ba0b.1556787930.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, 02 May 2019, Matti Vaittinen wrote:

> Document bindings for regulators (3 bucks, 3 LDOs and 2 LED
> drivers) and 4 GPIO pins which can be configured for I/O or
> as interrupt sources withe configurable trigger levels.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
