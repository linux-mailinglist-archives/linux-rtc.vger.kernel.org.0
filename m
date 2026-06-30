Return-Path: <linux-rtc+bounces-6792-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KdgIABP6Q2qWmgoAu9opvQ
	(envelope-from <linux-rtc+bounces-6792-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 19:17:07 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEDC6E6D33
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 19:17:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=QZuG5oPM;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6792-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6792-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BACF3121156
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 17:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BD43DBD44;
	Tue, 30 Jun 2026 17:10:57 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962EB3DBD53
	for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 17:10:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839457; cv=none; b=i+AXl1R6MBwbSUomgF/4FGEFpuvkp9l/oBmB0ZLi0og3BiNUUap7oSefKkHmlA/Ctbi81OqIsR0E0CQdNRHwPHJZVWm64SAsN7IltWo5P0Ku6CYO2gRHsnduOceJkhW7shrhfhvUtpFmd2gxghp20256NuOk4Q/TUy0okaras/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839457; c=relaxed/simple;
	bh=0H+Ax6a31/HJ2oUBnvoDFqKdomtZSHAbkuDZePd+miw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kMu5/C7FWiaTMD/vwbv8aqzoTeqxGVk0ASWxEWkqKjneykw70CUcMEkLYqAfK2pGUohsufe9kCoZY3XMRwnRUFfoM5nJwoZ1z06qXEtQ8sQQ/uAf+oj9L7CKupyi6oMCHVX9vUWB5dH+mgtpz3erfqvVOyK0mUPYunxkHKqZ8QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QZuG5oPM; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-472055b0efaso2449764f8f.2
        for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 10:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782839450; x=1783444250; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYTsuEBfN9D4FzWC3nXq13MXRqCGkyoQL6MZwe6p/uY=;
        b=QZuG5oPMm71eVHX13KhJAg0Koy7oGT2aOck3Yeh21I3EoOXwKAhkX97tmMGVwsy0iA
         UZFIZkr2UNMEC9dhhCfTu1WoZUphul0OSIvFXDJjgK7QAjVHkvUOQO0gso6u6AoG2PM0
         /9IiHtm+26gVKe+oVuw1GJHTXIfXigrMyaUDVOB1Xy3kRG9+5nxZoAE2ndwdlXdtpzW2
         aXHcvg9hSP8M9XhcoZd6jdTtQrmBKEpiSajoudtyNi3rXG8uPc1MHQL1lm7u9u4fVpa1
         uxLuO8/WYceNpfm8bFAzierZ6fw+CR9ZDIbJ0dRQ5pUT21EYx1J56990EH62A04r/tES
         2DtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782839450; x=1783444250;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rYTsuEBfN9D4FzWC3nXq13MXRqCGkyoQL6MZwe6p/uY=;
        b=PaEeeS1IotPYwUBQpstY8Mk9CuCUZwpRfcjspAK63q+RNr3ks0+wWAOEm4186e4w8Z
         1fiETo4p+lk8K9Rh/q/wrSlNzSJuWwVGICCv1q7qp5nNmX97B/0dcPh+4vqXhWOD0kkO
         xpanx0vbcrKYliHQJt08o0eWBoWEcnbo1HdZVVaL4VTFqYHY++fvPI7xmSL7gGQlyArd
         AwcBJ+j+XabLM6vNCx/9RY7w6+T6ikhRVWB37gm5XbR0JI81bYY/LWziPgQm8KNdzI2x
         oC2If47hZ9zD5+H8HjYvq1gO4NKoUhOjmYTijjab3UdUyGHS2WzqhG12uWPCXbBB4JWl
         zlXw==
X-Forwarded-Encrypted: i=1; AHgh+RrEK5Y6nbS6kgu74fqldQMGW43ev6zlXqXJ7dVcPUHRFwFV6rO3aE7DLUnO2nfso2XPR5LwVvJ2RMk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4fuBziqnN7RATo3psr9o3j8L+OWtMPI4w+sGTuPMHXvnvr5Qu
	C+QB/zb3hGQaP/5Zni+5voj5LuCJvD7z74JxWgCcRsmOOD3u21HHQdQLE77mN4rbX3M=
X-Gm-Gg: AfdE7ckWQg7rITdopM+Xp9qzabVVdH6r6Vtqu0GLE6qM+v3EC08xluOzkINhHlCkAFj
	QY5hFk86yBEkGfdcWVjNQ+KN+J1+OqXnj7a+RXMfwL02k3a/y+YF0bGq9BOphUils+XxvAf62Jz
	RNzRcOw6hMCmzhnc1kvli+MCdilMTarGCHQWDAniA2N70iiFeL1t+c6uSbyRwxMYEOQsw4ZmvL8
	WdYLfMipiHBsH6DHR+hJ1YJjZXLsfl032uaftqoZ7Q9srl1r0nSrjun7L4GW+QVF3SgFa+ApVVq
	IAWUASrOS0Ky+pUPKRUjX81sI27YGHM36a6FOlGsKmdcVFM7Jigdc/fXpkTfOjuKdK6QKfiFr5o
	LCg+wrlL42uF5fpFJqotx6VkAhVAinAI2vsmOXvZlL6Zj6cu3FLicz2TEG4v4p8tXt74eLOtVFY
	5KUhT5Yvr7iIlqiz2wKOT88AhlBSqj+b8pgrxvy93CA9D4OvwTtcOv
X-Received: by 2002:adf:e011:0:20b0:475:f100:3604 with SMTP id ffacd0b85a97d-4765c286378mr1658974f8f.51.1782839449715;
        Tue, 30 Jun 2026 10:10:49 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47563d195a7sm9017973f8f.7.2026.06.30.10.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:10:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 4/4] rtc: s35390a: convert to dev_err_probe()
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
In-Reply-To: <20260528-cleanup-dev-err-probe-rtc-v1-4-29dc9cb6c3f0@microchip.com>
References: <20260528-cleanup-dev-err-probe-rtc-v1-0-29dc9cb6c3f0@microchip.com>
 <20260528-cleanup-dev-err-probe-rtc-v1-4-29dc9cb6c3f0@microchip.com>
Date: Tue, 30 Jun 2026 19:10:30 +0200
Message-Id: <178283943069.3929176.6475131827523489401.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=0H+Ax6a31/HJ2oUBnvoDFqKdomtZSHAbkuDZePd+miw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqQ/iQtluAgKLSjyYJm4yn6dKMm4YHk5DuBBg4w
 hFuqbOGM5qJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCakP4kAAKCRArRkmdfjHU
 RSLxD/9fVu2YW7cQWBrsNbNwDCUXzjHOJ8DRaFR0jzymucRZCxd8CK8cyHGhLuwbCsbXDmpXAhw
 dFa+hP/tPW0YqOa7Kb2Tavj3Tq0794AvQka9rN5z1ay6xlVjGkjM3ZlwLaA9/d56F/toVIutUt7
 SoihX4eqX1d0qt2U08xgED9GWeUlxwtPk1L3+AKpgEG+xt3skrws6ut9EZrOC/sMXmyCVsgUQOB
 DWycBVVQ86YbE9flPLYwOE+9iCke4lN1Xg9YrebLvxxg1FleGbQABZPCOl7L5J2KsK3n+ozAmRm
 dxot47FevjJMaCqWCHwrG6T3p3D5UujrC4DW7oasyIFJsnwO6L1L84Lx6zBtRmGuodC1ZDIp3vc
 5VqdSJkOt09NUDKo08lfL97N5VCYk7l292dFa2sy0c3n0KDFPQ/iVQ+yN6JePvi2ga9ZzP8MYpq
 2Nvc6s0u7ZIv3an8ulD8Hciq4uU6y2wd6Er6a/rg8ljSQPAKOkqqM+R4kDt8R3eZuX0dNiZwluZ
 27uKvQOGfIwZuTFwZ5IIDKsgDfkDAQS8rQkEnWZF+z+TSuvxxjSMIUCF5O2exINRyTBNiZ+lbkO
 QXaA1ck9wPVF62Db3LpKTF0jQpw3pHvMScjlT+T4MU6waOuMrDbAI+/MxwmQchxlTGVNlzmmF8I
 nM+thKxDoij6CJg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6792-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:balakrishnan.s@microchip.com,m:alexandre.belloni@bootlin.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:orsonzhai@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[amergnat@baylibre.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.alibaba.com,gmail.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amergnat@baylibre.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3EEDC6E6D33

On Thu, 28 May 2026 09:16:47 +0530, Balakrishnan Sambath <balakrishnan.s@microchip.com> wrote:
> diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
> index a4678d7c6cf6..342fd2b568a3 100644
> --- a/drivers/rtc/rtc-s35390a.c
> +++ b/drivers/rtc/rtc-s35390a.c
> @@ -479,10 +479,8 @@ static int s35390a_probe(struct i2c_client *client)
>  		return PTR_ERR(rtc);
>  
>  	err_read = s35390a_read_status(s35390a, &status1);
> -	if (err_read < 0) {
> -		dev_err(dev, "error resetting chip\n");
> -		return err_read;
> -	}
> +	if (err_read < 0)
> +		return dev_err_probe(dev, err_read, "error resetting chip\n");

The devm_i2c_new_dummy_device() loop above this hunk still uses
dev_err()+return PTR_ERR("Address %02x unavailable"). dev_err_probe() takes
format args, so it converts cleanly:

    return dev_err_probe(dev, PTR_ERR(s35390a->client[i]),
                         "Address %02x unavailable\n", client->addr + i);

Worth converting for consistency with the rest of the probe.

> @@ -493,16 +491,12 @@ static int s35390a_probe(struct i2c_client *client)
>  		/* disable alarm (and maybe test mode) */
>  		buf = 0;
>  		err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, &buf, 1);
> -		if (err < 0) {
> -			dev_err(dev, "error disabling alarm");
> -			return err;
> -		}
> +		if (err < 0)
> +			return dev_err_probe(dev, err, "error disabling alarm");

This message is missing its trailing newline (pre-existing). dev_err_probe()
formats as "error %pe: %pV" and does not append "\n" itself, so the line
runs into the next log message. Since you are touching this line, adding
"\n" is a cheap fix even if the issue was here before your patch.
I recommand to fix it ;)

-- 
Alexandre Mergnat <amergnat@baylibre.com>

