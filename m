Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 440CD5B3185
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Sep 2022 10:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231523AbiIIIPe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Sep 2022 04:15:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231228AbiIIIP2 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Sep 2022 04:15:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339F890C59
        for <linux-rtc@vger.kernel.org>; Fri,  9 Sep 2022 01:15:26 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i26so1389591lfp.11
        for <linux-rtc@vger.kernel.org>; Fri, 09 Sep 2022 01:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=G9dF6A4OKGqKPWBJ/rsRlHvwJYl0XtUPK+SRDQT8YPc=;
        b=LF17xs37jw3OQrFl05WuIzpxwcuS4Yf3J7JQfuPYJV2DVTh/thJ3UMao+7qmXL4qyr
         3jZPxosS/lqwUykQdDSZBlWmyW0PYQVI571dwZ3GXRFmhPxo2G/fCLKnSlXjBuXvLrU5
         WES2FH+Jhn/hprX5Ruxs1tYdcxiLbcyBAXMzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=G9dF6A4OKGqKPWBJ/rsRlHvwJYl0XtUPK+SRDQT8YPc=;
        b=KHINoX1Dciu5flv9Icsv46j5AvECfpORXJkimkCMB+4FLkfprffUaztiH8xxLTNd2j
         iYLDmg2fRDHHtKH8NuQ0Q4avxq81PdJBEOigACF+x9sI+NbaquwS4weSh3r3kf5dWCw8
         T8631BkoOWzbE687LIPPEAZajP6gnvNKUMB+AdF6i1pslNIlOi1Vub+w0SfdmKJEJACr
         XysNy8TgFHp8ttntxMcTAYd29N1rn3zPSeyzE/rUZ0a8OlcHH0iFaRAHUt7nUdTED+nF
         V4vY/C36WdSxkkeGkf1OPrl/9PgnoTWTrNaWO6/1snvIVTujs2IHLzXaGIdpAaahKkPD
         FBmg==
X-Gm-Message-State: ACgBeo1/SkUn9pHgJP1z1J8lOR6T3pa243A2tSKKilDcaAS99Ode5XYE
        6iF5cLNJXIZlOtQvXewe8A4UNQ==
X-Google-Smtp-Source: AA6agR78Go+tnxdAfSDFi/lV2IDV0LZRhTJAeNsURPRHLWJ8IT6wFwVvPB3ulOqU8ARXBHAiPLZC0w==
X-Received: by 2002:a05:6512:3501:b0:496:d15:e614 with SMTP id h1-20020a056512350100b004960d15e614mr4343150lfs.194.1662711324507;
        Fri, 09 Sep 2022 01:15:24 -0700 (PDT)
Received: from [172.16.11.74] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id x12-20020a19f60c000000b004946e72711bsm183381lfe.76.2022.09.09.01.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 01:15:23 -0700 (PDT)
Message-ID: <174dd607-25b6-26c0-e6e7-1634c5b01dbc@rasmusvillemoes.dk>
Date:   Fri, 9 Sep 2022 10:15:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/6] rtc: isl12022: cleanups and hwmon support
Content-Language: en-US
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20220830100152.698506-1-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/08/2022 12.01, Rasmus Villemoes wrote:
> This series does a few cleanups of the isl12022 driver,
> 
> - removes use of deprecated function
> - removes some  redundant code
> - switches to regmap API instead of private helpers
> 
> and finally hooks up the temperatur sensor to hwmon.

ping. Any comments before I respin 6/6 to address Guenter's request?

Rasmus
