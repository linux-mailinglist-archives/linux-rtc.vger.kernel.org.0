Return-Path: <linux-rtc+bounces-5906-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON/MBx/ieWm50gEAu9opvQ
	(envelope-from <linux-rtc+bounces-5906-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Jan 2026 11:17:03 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 771A59F575
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Jan 2026 11:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A388830086DE
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Jan 2026 10:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE8B2571A0;
	Wed, 28 Jan 2026 10:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="p7N6rx3y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51162E9ED8;
	Wed, 28 Jan 2026 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595399; cv=none; b=RPObebkDcuJXQJT+Ox6Si6Plpr1jb9iigQSX+sBhvzNF7LsjMWHH+jYnvK5uRRK7A4+oIRboYOaPjDZ12OeR8BUArb/cCP8KqLoTjNcOKlooNOsLG15dD8QDwjDqpY9Wp3cu8U54UNlOxoox+2DBY16hPbbbTqopznl0bKnleno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595399; c=relaxed/simple;
	bh=bChKrsqJ1WmfTZMzJVCGIr+sdu1+IT2qMX7Q8eH/1/A=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=JBHRw+U3Ja5mR7UV30cPTHuSdk0NDF2ZgxaQnIhvFpmIgSfpr2aUqpPVX+84vHYksZfECAeIK3NDTK9i50CAg1X0LykUDDTnr6yFsv9IbbuUzXKhgt8KkTHba7sb2xV24rMA7uZLkbR4TGyp1AfYl6JskmF9dsq5XOKxUNTIXSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=p7N6rx3y; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769595389; x=1770200189; i=markus.elfring@web.de;
	bh=bChKrsqJ1WmfTZMzJVCGIr+sdu1+IT2qMX7Q8eH/1/A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=p7N6rx3yEyWCoHC7adZMehvqGQBFOyoB7m/30xeczboPf431nwbj/Sm6RR72nknj
	 po+qclD+y7RQjqc+2HzgKC5Ga4XE89jTqDY6vyHPxdFcxjg0CQp6smx97WTDILfNZ
	 lYYQR8O4iIK+gOnFakfzfWc6rn10wklt1BBy3yT/1HZzw4zFtaPFJFDkBtshrpw5i
	 DgvQ+S49RGrnnKDQgtp2PGEwQWqJDM0onCPTpwWSo485H4WksD9OnXNGj/OlVjDsD
	 03fpWriQmrtmEoCAuF6qBu2NulWi8mzmLM3I5bAZ66EiSee50+LfgJZhuOs2Ek1vO
	 ued4WqbqYFyOuC9yYw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.179]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPaMQ-1vPXhP2dBS-00S3KG; Wed, 28
 Jan 2026 11:16:29 +0100
Message-ID: <5e1dc896-6079-4930-a75c-a9a0cb68bfe3@web.de>
Date: Wed, 28 Jan 2026 11:16:28 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, linux-rtc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260128043430.2260970-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] rtc: isl12022: Add missing check for
 device_property_read_u32_array
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260128043430.2260970-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Oz+YHlPToddbVR0IYyHNdJd7Dj+aLWN+XitUIlcHiZ0xJ3P9i8z
 hchQ8+/FbFyfRyFqT/R5O5ckYfABIvR+v/X9B8UlCUSkhkQitPaWFoeHCKgHMTpQBIIHmef
 XLNkAdD2oNOQ5zEY+217X0T0WOMS2Rws3eCc1atvgvluR5OSqb5b6DhL4z3sXi4msxajt70
 0BHUEj0XYHRAYM+MA/B9A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zwlg8cf0x3w=;Seaiyey569KsnsG58bdk1tCw5Ro
 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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5906-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	FREEMAIL_FROM(0.00)[web.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 771A59F575
X-Rspamd-Action: no action

> Add check for the return value of device_property_read_u32_array() and
> log a warning message if it fails in order to catch the error.

* Were any source code analysis tools involved here?

* Did anything hinder to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus

