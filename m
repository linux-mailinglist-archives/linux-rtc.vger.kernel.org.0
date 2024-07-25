Return-Path: <linux-rtc+bounces-1599-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5D693CA33
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 23:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 734F42832A8
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jul 2024 21:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE3613E8A5;
	Thu, 25 Jul 2024 21:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="REJ+iBQe"
X-Original-To: linux-rtc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163745C8FC;
	Thu, 25 Jul 2024 21:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721942968; cv=none; b=qQAnFxFwQbcYdmI+3SpQqdO0gJWkqURdUM1wgCUgKLe/VtGakL/ltQCGF/FyrWznjeeTOovHiqekkmy/4ScjPsHd+Gm3ZnFJCbessyuByfSB8bJWiViKbfdyHSHGobrJT/ZcxIjXIlkbiNHUvoflXqZz/BioUlL+JXeVcLbWnSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721942968; c=relaxed/simple;
	bh=Q90uc4LOnmdv2OKNqlUC9fycnepRosE/8g5PuihVQG8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=al7jBbHgHm3BtssLL68DBBJtKOFlHm2lOjtwHGfvX5w1VNf7bySkoZJpPqUQcOOB5uvmGvNk/1nuqRKBE1sELf5VLukadZPdI5oCeB0MvulLUlYZQXB/uN7lKLLwRWjPTSuIW0vSK8LtvDiDELNlPkvq9cDKLkxAu+nbNJTngjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=REJ+iBQe; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q90uc4LOnmdv2OKNqlUC9fycnepRosE/8g5PuihVQG8=; b=REJ+iBQeySSH9OaarXgFn5Hmtp
	Jy7LBWC+g1YbDnBIeEvuReXSOlCnLDIr9jsyT43yP5RKZTbPgBH5n+HInGmvfYE40IRz0egaSkHdF
	0dysbYSdMlBGRuE/qTwM1FRa3DUQIuVTXG8y7fwz4ut21puaSekx+OBmsEBWI4A35wMEdMVZxeWD5
	n9J9Pe2+XXXnI/ekPZlKgI72HuA9KBE/kkiWAXk8GGw0Qjt4fH7zjBtX8o0Q4LKB95+harAb00TNS
	fHAU/fR330mu9yECcNlyEY/ghF7SEArc3nv/WYfkHYe6lPsRGaRYyqixy7v3qQHaUqRFTLcr1oFh0
	fXPgcEMA==;
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX61X-00000009Ory-2ouN;
	Thu, 25 Jul 2024 21:29:19 +0000
Message-ID: <c5a48c032a2788ecd98bbcec71f6f3fb0fb65e8c.camel@infradead.org>
Subject: Re: [PATCH] ptp: Add vDSO-style vmclock support
From: David Woodhouse <dwmw2@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Richard Cochran <richardcochran@gmail.com>, Peter Hilber
 <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org, 
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>, 
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>, "Chashper,
 David" <chashper@amazon.com>, "Mohamed Abuelfotoh, Hazem"
 <abuehaze@amazon.com>,  "Christopher S . Hall"
 <christopher.s.hall@intel.com>, Jason Wang <jasowang@redhat.com>, John
 Stultz <jstultz@google.com>,  netdev@vger.kernel.org, Stephen Boyd
 <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Marc Zyngier <maz@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, qemu-devel <qemu-devel@nongnu.org>, Simon
 Horman <horms@kernel.org>
Date: Thu, 25 Jul 2024 22:29:18 +0100
In-Reply-To: <20240725170328-mutt-send-email-mst@kernel.org>
References: <20240725082828-mutt-send-email-mst@kernel.org>
	 <db786be69aed3800f1aca71e8c4c2a6930e3bb0b.camel@infradead.org>
	 <20240725083215-mutt-send-email-mst@kernel.org>
	 <98813a70f6d3377d3a9d502fd175be97334fcc87.camel@infradead.org>
	 <20240725100351-mutt-send-email-mst@kernel.org>
	 <2a27205bfc61e19355d360f428a98e2338ff68c3.camel@infradead.org>
	 <20240725122603-mutt-send-email-mst@kernel.org>
	 <0959390cad71b451dc19e5f9396d3f4fdb8fd46f.camel@infradead.org>
	 <20240725163843-mutt-send-email-mst@kernel.org>
	 <d62925d94a28b4f8e07d14c1639023f3b78b0769.camel@infradead.org>
	 <20240725170328-mutt-send-email-mst@kernel.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-BGTznpejpLNvtJPOhuTG"
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-BGTznpejpLNvtJPOhuTG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-07-25 at 17:04 -0400, Michael S. Tsirkin wrote:
> On Thu, Jul 25, 2024 at 10:00:24PM +0100, David Woodhouse wrote:
> > On Thu, 2024-07-25 at 16:50 -0400, Michael S. Tsirkin wrote:
> > > On Thu, Jul 25, 2024 at 08:35:40PM +0100, David Woodhouse wrote:
> > > > On Thu, 2024-07-25 at 12:38 -0400, Michael S. Tsirkin wrote:
> > > > > On Thu, Jul 25, 2024 at 04:18:43PM +0100, David Woodhouse wrote:
> > > > > > The use case isn't necessarily for all users of gettimeofday(),=
 of
> > > > > > course; this is for those applications which *need* precision t=
ime.
> > > > > > Like distributed databases which rely on timestamps for coheren=
cy, and
> > > > > > users who get fined millions of dollars when LM messes up their=
 clocks
> > > > > > and they put wrong timestamps on financial transactions.
> > > > >=20
> > > > > I would however worry that with all this pass through,
> > > > > applications have to be coded to each hypervisor or even
> > > > > version of the hypervisor.
> > > >=20
> > > > Yes, that would be a problem. Which is why I feel it's so important=
 to
> > > > harmonise the contents of the shared memory, and I'm implementing i=
t
> > > > both QEMU and $DAYJOB, as well as aligning with virtio-rtc.
> > >=20
> > >=20
> > > Writing an actual spec for this would be another thing that might hel=
p.

Potentially, although working over it with our internal clock team and
with Peter on virtio-rtc has put us in good shape. I'm confident now
that we have something that's viable and extensible enough.

> > >=20
> > > > > virtio has been developed with the painful experience that we kee=
p
> > > > > making mistakes, or coming up with new needed features,
> > > > > and that maintaining forward and backward compatibility
> > > > > becomes a whole lot harder than it seems in the beginning.
> > > >=20
> > > > Yes. But as you note, this shared memory structure is a userspace A=
BI
> > > > all of its own, so we get to make a completely *different* kind of
> > > > mistake :)
> > > >=20
> > >=20
> > >=20
> > > So, something I still don't completely understand.
> > > Can't the VDSO thing be written to by kernel?
> > > Let's say on LM, an interrupt triggers and kernel copies
> > > data from a specific device to the VDSO.
> > >=20
> > > Is that problematic somehow? I imagine there is a race where
> > > userspace reads vdso after lm but before kernel updated
> > > vdso - is that the concern?

Yes.

> > > Then can't we fix it by interrupting all CPUs right after LM?
> > >=20
> > > To me that seems like a cleaner approach - we then compartmentalize
> > > the ABI issue - kernel has its own ABI against userspace,
> > > devices have their own ABI against kernel.
> > > It'd mean we need a way to detect that interrupt was sent,
> > > maybe yet another counter inside that structure.
> > >=20
> > > WDYT?
> > >=20
> > > By the way the same idea would work for snapshots -
> > > some people wanted to expose that info to userspace, too.

Those people included me. I wanted to interrupt all the vCPUs, even the
ones which were in userspace at the moment of migration, and have the
kernel deal with passing it on to userspace via a different ABI.

It ends up being complex and intricate, and requiring a lot of new
kernel and userspace support. I gave up on it in the end for snapshots,
and didn't go there again for this.

By contrast, a driver which merely exposes a page of MMIO space
identified by an ACPI device (without even the in-kernel PTP support)
could probably be fewer than a hundred lines of code. In an externally-
buildable module that goes back as far as RHEL8 or even further,
allowing users to just build and use it from their application.

> was there supposed to be text here, or did you just like this
> so much you decided to repost my mail ;)=20

Hm, weirdness. I've known Evolution get into a state where it sends
completely *empty* messages, but I've never seen it eat only my own
part before. I had definitely typed responses (along the lines of the
above) last time.

--=-BGTznpejpLNvtJPOhuTG
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNzI1MjEyOTE4WjAvBgkqhkiG9w0BCQQxIgQgq9+2y+3H
6TnHc0ClhgkHrfKEBvwql/ZMh4oWK23XC6Iwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgAteNgAJXezFSj58HyU1aY3NQHXtsTyn0JV
edbfvfE9hjXirZLQmLqBkpNEw/v5QqouJp9IEZKXEuXaWgEqaric73FsPCnmzdyZSd+oPbDAALjZ
5mLbp7OfimAldUdOdRxYDC1NP80qqBx1CRhufSrtIBTS5epAyAglUD1m6fKKhmvZpRzfdIRHKQB2
gITM/WP67w/ptrsQj2VUGBqCxiQnIcPgvOgJfOY9aySzlmsY5E1s2hqzWn+/muQJltq4vZYZib5n
FAPt7GhyW5humG7ew82ku+dsnvs7f/Yqlp3P1yQ0kiIF4Oo0FK0W9FiUizsadiTtuxnbmrqrViRO
4kdpmSyTJ4ByRHTfLj/freEhqCPYh4IPKXVDTzThYvf3G5AHaebDxtoUUNt3bOUbaI0+AH5miKmr
rZpMYkN7QLyOIVQ13wVXwM0Fb2EQLdC3G/VAie0kTECI3rTAhvBuVzJX3vWhEnM5avBTiD7Alsxl
fNNjKgwTtMFSfJjOKn9HwPq4/3+IEK9+ko+rJO/17p46sKsWQhERNzeaqY7HMhjZjXp7tFjESNDg
DynM09exfDqJCwQoANOatPYUmAxFJWi2wWvdHe//DMvdy6F5o6K+QoUCZC0jIu38z1ulH1V44vGk
cz1JtaWupWDWv1saucp4DSCMy12TR5NgCclYYWOV+AAAAAAAAA==


--=-BGTznpejpLNvtJPOhuTG--

