Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC4BF77E314
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Aug 2023 15:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243971AbjHPNyH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Aug 2023 09:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235546AbjHPNxc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Aug 2023 09:53:32 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5682110
        for <linux-rtc@vger.kernel.org>; Wed, 16 Aug 2023 06:53:31 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id C68F0320092E;
        Wed, 16 Aug 2023 09:53:29 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 16 Aug 2023 09:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1692194009; x=1692280409; bh=Ii
        4yG/ZcyE3q39VYUZ9Y40rpiAUHhEuHOoKZpmHnIVE=; b=XKQOm2vRAaeMr+s8ia
        bET6858Gma6hb0CAP8dE01xA+DqcXKFGMrEOvfVTh0+i2vJyn8htU0Xwl7Kn4vK3
        5xgSDnQ7znZp6b0M10tQiV72JONEyKerZnlWEXwHcTQixD3WfmGznqNqStL021ER
        E5PUH8Mk07tqqmFuhJZ0bb483vknpjor3huVfhokUCNsmIfaLPcmS7jCQXx0aP62
        T+s/6bfKSECdOPD9cQZjsAo+wMHET4RO2y0tmgzJiEYY6ecl7WYalBNb95kC9fW/
        NbIw1889k1DkVlV+3SnrkLJQXwCElA1SN0Oo4//e8AK0ZbjUaH4MuF4EdtCjtoW2
        tceA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1692194009; x=1692280409; bh=Ii4yG/ZcyE3q3
        9VYUZ9Y40rpiAUHhEuHOoKZpmHnIVE=; b=fazCe2n5+x9PGnyaSSn7RwjPqyZVC
        1ciHlLmGQP5bSXQ/00Bm2lXXR265/t3mANvGN6gbgaVWXExW6WdEzCw9YZICH3iA
        WKIvCsJOKhJt46Hruzyb51RNPQ84rOHaEn6eAiPxbKMHtswPXIU+1yZu988m2zUO
        CjXl4za2UZhtsN5+FCt4EdVhzGlc+opHsP/JrzCdbxJ54uzTC5qXubbljHivpHY8
        Vx46Az8iooLs3nFlBLK/vyR0t3+no7lTiCjCscAm6fHxaCX3ySuZ7om6j7egv5wu
        N5EsVu3s7qx0ow0OydR+/Jf1V++kt/Sn3lr4uAOCxnYQ5Z5jxqxsQGZaw==
X-ME-Sender: <xms:2NTcZKoX3PRXcOGPjz-G7b93mLLkNhXJoccUoAcbeddj-97N99CUag>
    <xme:2NTcZIrrpoM6AMP77rN0ErNAZN57056JQ6694zOKWfvsOh60TkQBMmlTRTlE_ukOl
    btY-PBqZLgDjWugca4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtledgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:2NTcZPOdSMw6KTThLUurAJbPgTAfzshXIUhqeW1a0w9sr8Q77LBjlA>
    <xmx:2NTcZJ7-utNZFV7D8rFD2wzSboqJlylJSxaY4AcqBmGhGvjXzystlg>
    <xmx:2NTcZJ4hTCGE4wuBGi5JSV3NDDQgO6Q0oTd0Abu-fMhYljy4PO8JAw>
    <xmx:2dTcZGu7hgiLnEoBIu9C3in-rQWwTXue7qRYELawHRLWHQX_5QBH1g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 68E88B6008D; Wed, 16 Aug 2023 09:53:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <df08d0d5-2598-4805-a1bd-43d223092311@app.fastmail.com>
In-Reply-To: <20230815-rtc-stm32-unused-pm-funcs-v1-1-82eb8e02d903@kernel.org>
References: <20230815-rtc-stm32-unused-pm-funcs-v1-1-82eb8e02d903@kernel.org>
Date:   Wed, 16 Aug 2023 15:53:07 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Nathan Chancellor" <nathan@kernel.org>,
        "Alessandro Zummo" <a.zummo@towertech.it>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>
Cc:     "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
        linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, patches@lists.linux.dev
Subject: Re: [PATCH] rtc: stm32: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On Wed, Aug 16, 2023, at 00:16, Nathan Chancellor wrote:
> After the switch to SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() and a subsequent
> fix, stm32_rtc_{suspend,resume}() are unused when CONFIG_PM_SLEEP is not
> set because SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() is a no-op in that
> configuration:
>
>   drivers/rtc/rtc-stm32.c:904:12: error: 'stm32_rtc_resume' defined but 
> not used [-Werror=unused-function]
>     904 | static int stm32_rtc_resume(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~
>   drivers/rtc/rtc-stm32.c:894:12: error: 'stm32_rtc_suspend' defined 
> but not used [-Werror=unused-function]
>     894 | static int stm32_rtc_suspend(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>
> The non-"SET_" version of this macro, NOIRQ_SYSTEM_SLEEP_PM_OPS(), is
> designed to handle this situation by only assigning the callbacks when
> CONFIG_PM_SLEEP is set while allowing the functions to appear used to
> the compiler. Switch to that macro to resolve the warnings. There is no
> functional change with this, as SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() is
> defined using NOIRQ_SYSTEM_SLEEP_PM_OPS() when CONFIG_PM_SLEEP is set.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> ---
> I am not sure what to do about a Fixes: tag for this change. I am not
> sure how Arnd triggered the error/warning in commit a69c610e13e2 ("rtc:
> stm32: remove incorrect #ifdef check"), since from what I can tell,
> SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() is only defined in terms of
> NOIRQ_SYSTEM_SLEEP_PM_OPS() when CONFIG_PM_SLEEP is set, so I am not
> sure how those functions could be absent in the source file but used in
> NOIRQ_SYSTEM_SLEEP_PM_OPS() when CONFIG_PM_SLEEP is unset... I could be
> missing something though.

It was a mistake on my end: my randconfig tree has an experimental
patch to clean up all 13 users of SET_NOIRQ_SYSTEM_SLEEP_PM_OPS()
that actually rely on the old behavior and changing the definition
to be the same as NOIRQ_SYSTEM_SLEEP_PM_OPS. I should get back
to that series and actually send out patches towards removing
the deprecated helpers.

      Arnd
