Return-Path: <linux-rtc+bounces-6912-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id In+0BKSDS2rqSgEAu9opvQ
	(envelope-from <linux-rtc+bounces-6912-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:29:56 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BABA70F2F3
	for <lists+linux-rtc@lfdr.de>; Mon, 06 Jul 2026 12:29:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=ZVdSsB1V;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6912-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6912-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B42F3058A13
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2026 10:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38513B3BFE;
	Mon,  6 Jul 2026 09:43:42 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA3F4218A5
	for <linux-rtc@vger.kernel.org>; Mon,  6 Jul 2026 09:43:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331019; cv=none; b=P7KvilgfOhaJlXepBa2btw1O5RVlU8xY8NTnMBgNyUjEXAcjkrN5rO9PEpxnBmXeAkrzfm0Gib+H5HJ+GbxhgNzh7Pa6DAsNqWa2hXvfHrvP9Mg8NBZKrlAqSrwjeCdGkK7BLkyC2jeCCt+7jf4iGvYNgV2x2gzDwYaCnDaSmrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331019; c=relaxed/simple;
	bh=jqSOTQtg59RT4VVfL/qcCLRu44Lo3jebqHXsEe4R5l4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTd/F2MRZKF1IzW/O9XL88zP2ttAqJDWM1mnih9Ag9GKoN9obp+rMmkcDr8BGhCA2jpHNy17P56r8zgyEHb8rar1tmypP5rgVBuuyLGt1aoUquZiDWJjPWf0jcx0bCO/+0Q1Mtj0sqZ1NQs/Vp6+Acf/73lMCYoe/vSFjSQpHHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZVdSsB1V; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47362928f65so2758903f8f.2
        for <linux-rtc@vger.kernel.org>; Mon, 06 Jul 2026 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783331013; x=1783935813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ius48xpF/Q52UbEJhkb3b+cG1v9KO7V1b2R8m4riPc4=;
        b=ZVdSsB1VNOUA9kI3hwKFcWuYZEPH6w6qwaBFQnFDy0RAKHTntq6NdQn5jGvRUWnXdm
         e1OfaWCVf9Pg75gk4WzQTIC+F9AL+lp0/QcKvZ5FsAccUQYejFoLA/S+5GyPA2HeHFpj
         9AbHgnSyFmS4YLR6gtf7n9fyb6seh/9m9aMF4JnAK78ymHfCFf3q+5BxgYhXKda8PRwV
         A43UfL8DmAc5NOfQAJbw1CiBlFEQ6CWFGDLrE3G84W7Kci0eylLJRRU9M8p46FScGzKy
         c4GsxTH/6SOdsJMKZfySI56hOZZXAYHzJj7TLJ3i8yN1IYzZqeruLtHIreXC4pbLrzbc
         qlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331013; x=1783935813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ius48xpF/Q52UbEJhkb3b+cG1v9KO7V1b2R8m4riPc4=;
        b=OnUnRt1M5EtS/s9xAh2JZfcI9vQBEprBoOIIFKx6uLmdtAUd3LVPaaNx2pHi6whUzB
         nFf8o/htYdaSz2iD5M1blZQOm692RALbTkgM4oW5Wle6J3K+iPTJh5XHimlAUF5ODOj/
         XX3d4CDWXp823KobGiaWS5Zdja9vEIfgVHe4HfCpmgoi1qKBcIDBiG+w/qRg+tBu1p3G
         zEyevlIhkFhu4Vkwqsji9e60U9v0H9nH90kxDOjNvZu0iR1GzSAOa9fe90mh4I8AXWJ5
         m4cFzTJnQPk57gwMjbSj/ISgvv28Y/qZjIi+k+ICuIVXiIuIHL9Dp8dayhmKJlS5xF1E
         XSGg==
X-Forwarded-Encrypted: i=1; AHgh+RpNx6uhoN5ncbY7khxtXEbq1TAS7nAs0ayldxTlCyqdr9PA0xCQjBk6RsYTgY74+Zn13uwt/8mmKDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE1xtMKMhZnCpCmPay4aPVHyfc5NSnfvURjt1rd7rA6wNefS2h
	tOxag6UTihWXx11SDUqlxGQD7AsURAQv5te6kY13vg9H+GOVdOVVRExiIIk7NhE16vo=
X-Gm-Gg: AfdE7ckmJd3JYISUj8pXnH7m3AqRQF5tAYRviagSidj32kkHRZ9T5P1xI03bjrgFsc4
	T0LJMsJ2HmyxQg0OH+2ejQAu/OBFkFi3R4soZyNcdKMFK9wqqNT9Tz1CH2oq/9AIAcMt/STIZOp
	czIC13IreVx6JDUN1yizhZPmm/QnmTcYgszMdH3b3UZ6LJaiSixP2QEChZxKtrG36WRmzYnhIhd
	9B/xb/AEEH/gacHI0fZQGGLDeByPIR6Ka9NRQf83YPRlhvu08trMT7p0w2RF+5Znmms3HN7AymZ
	+KHmZSE3RqpinCTCXfLB6eQg8dgUGug1mO+K4mRYTyTXf0PsBJOi6oKnR4mYcpj75wvXt5p6HBc
	b/QoeiV9YUHQsodeEG5wgOj4OR/XLncvf80baZbtpyIt4T9LRSSxrbNAfVuHGSONAdMtB2cx/pM
	jzYRtnXBcoi2mSBVNfazfottDzjbO4qbUHKrWPHGeVZ4pNo+PHwQomcyJcMAuk
X-Received: by 2002:a05:6000:420d:b0:474:ad57:1720 with SMTP id ffacd0b85a97d-47aae0da45fmr12468300f8f.43.1783331012745;
        Mon, 06 Jul 2026 02:43:32 -0700 (PDT)
Received: from [192.168.1.136] (48.85-85-171.dynamic.clientes.euskaltel.es. [85.85.171.48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9b4d850dsm24266171f8f.0.2026.07.06.02.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:43:32 -0700 (PDT)
Message-ID: <67fa35d6-548f-4d52-8164-d31433fd1b1c@suse.com>
Date: Mon, 6 Jul 2026 11:43:29 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: s32g: add missing MODULE_DEVICE_TABLE()
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Chester Lin
 <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260704122003.70108-1-pengpeng@iscas.ac.cn>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260704122003.70108-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6912-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:chester62515@gmail.com,m:ghennadi.procopciuc@oss.nxp.com,m:s32@nxp.com,m:alexandre.belloni@bootlin.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,gmail.com,oss.nxp.com,nxp.com,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mbrugger@suse.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mbrugger@suse.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,iscas.ac.cn:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BABA70F2F3



On 04/07/2026 14:20, Pengpeng Hou wrote:
> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
> 
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
> 
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   drivers/rtc/rtc-s32g.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
> index 3a0818e972eb..86716192d10f 100644
> --- a/drivers/rtc/rtc-s32g.c
> +++ b/drivers/rtc/rtc-s32g.c
> @@ -366,6 +366,7 @@ static const struct of_device_id rtc_dt_ids[] = {
>   	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data },
>   	{ /* sentinel */ },
>   };
> +MODULE_DEVICE_TABLE(of, rtc_dt_ids);
>   
>   static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
>   			 s32g_rtc_suspend, s32g_rtc_resume);
> 


