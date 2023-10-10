Return-Path: <linux-rtc+bounces-83-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AD57C0026
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Oct 2023 17:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79CE01C208FE
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Oct 2023 15:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B873715A;
	Tue, 10 Oct 2023 15:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EA8aO9qt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6kJnWBMs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C56E21364
	for <linux-rtc@vger.kernel.org>; Tue, 10 Oct 2023 15:16:31 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C19AAC;
	Tue, 10 Oct 2023 08:16:28 -0700 (PDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1696950986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jtkhrz8Wds3YByOny2qieBZFvlhoRSbJRnrkGxOj/8s=;
	b=EA8aO9qtzCtdIIs3RB6R+H+yerguUoA4x7WGlWDVrlar2Ug8XOgXTjssquzdtFavax7YpH
	fGb5RLU9tXldOjNRPt0ACkXrRPf7ndi0Nettuj8lRVBID5GHd3/XyAvJ2LuvpsKBgt7QTd
	ThVSNXVfsRTXeBZrGVQfLmBTqVhBy1m6fv230wmgEpXEFr76o+nBuO0XC3rm8/PUOgrUQ4
	bqmAT8WM4Z6F6s9SmFYbb4VVk/DyA8XJ1yyoH8Qsy8uD0dkrQZEiQTP+xfPm4VJPP9XGIE
	UH7sUr31sk7CKra01QYXudZbtffyi5VzXL4Ly9pwbp4c31lVuvT42z9b7rdbKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1696950986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jtkhrz8Wds3YByOny2qieBZFvlhoRSbJRnrkGxOj/8s=;
	b=6kJnWBMsthzSw/fz7cKfale38tOjGv9DQfrYEvUmRAkRqh0m8GjA7XdsSdWPy2dkNkTQ8C
	aHwy7fhV3sdxaODw==
To: Biju Das <biju.das.jz@bp.renesas.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Douglas  Anderson <dianders@chromium.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Biju Das <biju.das.au@gmail.com>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2] alarmtimer: Fix rebind failure
In-Reply-To: <TYCPR01MB11269FF2DBFDC96B9C12D2E5E86CDA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20230922081208.26334-1-biju.das.jz@bp.renesas.com>
 <87il7fq1al.ffs@tglx>
 <TYCPR01MB112697A5D4B57101CDE27C88D86CEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <87fs2jpznr.ffs@tglx>
 <TYCPR01MB11269C6BF3934F9AAC44F855186CEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <87bkd7pic3.ffs@tglx>
 <TYCPR01MB11269FF2DBFDC96B9C12D2E5E86CDA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Date: Tue, 10 Oct 2023 17:16:26 +0200
Message-ID: <87o7h6o6d1.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Biju!

On Tue, Oct 10 2023 at 06:18, Biju Das wrote:
> RTC driver is defined as a module, so I was testing
> remove/unbind followed by install/bind on RTC driver to check
> any resource leakage and found that device is not working properly.
>
> As you mentioned above, we should not remove RTC driver. So I would
> like to drop this patch.
>
> Is there any place we can document this to avoid another person doing
> same mistake?

The point is that the removal should not happen in the first place.

Though it seems that even a held refcount on the module is not
preventing that, which is bad to begin with.

That aside I'm not saying that supporting removal is completely
impossible. The charger driver can probably be fixed, but as this is a
user space visible change this needs a lot of thoughts and proper
analysis why such a change would be correct under all circumstances.

Thanks,

        tglx

